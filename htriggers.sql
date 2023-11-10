-- Comandos sql para a criação das triggers de historiamento

CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HBNF
BEFORE UPDATE OR DELETE ON BENEFICIARIOS
FOR EACH ROW
BEGIN
    INSERT INTO HBENEFICIARIOS values(
        :OLD.bnf_id, 
        :OLD.bnf_cpf, 
        :OLD.bnf_dt_nasc, 
        :OLD.bnf_deficiente_fisico, 
        :OLD.bnf_sex_id,
        :OLD.bnf_rcs_id, 
        :OLD.bnf_mun_id,
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HBSL
BEFORE UPDATE OR DELETE ON BOLSAS
FOR EACH ROW
BEGIN
    INSERT INTO HBOLSAS values(
        :OLD.bsl_id, 
        :OLD.bsl_ano, 
        :OLD.bsl_crs_id, 
        :OLD.bsl_ite_id, 
        :OLD.bsl_bnf_id,
        :OLD.bsl_tpb_id, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HCRS
BEFORE UPDATE OR DELETE ON CURSOS
FOR EACH ROW
BEGIN
    INSERT INTO HCURSOS values(
        :OLD.crs_id, 
        :OLD.crs_nome, 
        :OLD.crs_mdl_id, 
        :OLD.crs_trn_id, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HITE
BEFORE UPDATE OR DELETE ON INSTITUICOES_ENSINO
FOR EACH ROW
BEGIN
    INSERT INTO HINSTITUICOES_ENSINO values(
        :OLD.ite_id, 
        :OLD.ite_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HMDL
BEFORE UPDATE OR DELETE ON MODALIDADES
FOR EACH ROW
BEGIN
    INSERT INTO HMODALIDADES values(
        :OLD.mdl_id, 
        :OLD.mdl_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HMUN
BEFORE UPDATE OR DELETE ON MUNICIPIOS
FOR EACH ROW
BEGIN
    INSERT INTO HMUNICIPIOS values(
        :OLD.mun_id, 
        :OLD.mun_nome, 
        :OLD.mun_ufs_id,
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HRCS
BEFORE UPDATE OR DELETE ON RACAS
FOR EACH ROW
BEGIN
    INSERT INTO HRACAS values(
        :OLD.rcs_id, 
        :OLD.rcs_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HRGS
BEFORE UPDATE OR DELETE ON REGIOES
FOR EACH ROW
BEGIN
    INSERT INTO HREGIOES values(
        :OLD.rgs_id, 
        :OLD.rgs_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HSEX
BEFORE UPDATE OR DELETE ON SEXOS
FOR EACH ROW
BEGIN
    INSERT INTO HSEXOS values(
        :OLD.sex_id, 
        :OLD.sex_letra, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HTPB
BEFORE UPDATE OR DELETE ON TIPOS_BOLSA
FOR EACH ROW
BEGIN
    INSERT INTO HTIPOS_BOLSA values(
        :OLD.tpb_id, 
        :OLD.tpb_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HTRN
BEFORE UPDATE OR DELETE ON TURNOS_CURSO
FOR EACH ROW
BEGIN
    INSERT INTO HTURNOS_CURSO values(
        :OLD.trn_id, 
        :OLD.trn_nome, 
        SYSDATE
    );
END;



CREATE OR REPLACE NONEDITIONABLE TRIGGER TG_HUFS
BEFORE UPDATE OR DELETE ON UFS
FOR EACH ROW
BEGIN
    INSERT INTO HUFS values(
        :OLD.ufs_id, 
        :OLD.ufs_sigla,
        :OLD.ufs_rgs_id, 
        SYSDATE
    );
END;