CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_BNF" BEFORE
INSERT
    ON BENEFICIARIOS FOR EACH ROW BEGIN :NEW.bnf_id := seq_bnf.nextval;

END;


/ ALTER TRIGGER "APP_LAB"."TG_SEQ_BNF" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_BFN trigger para criar o id do BENEFICIARIO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_BSL" BEFORE
INSERT
    ON BOLSAS FOR EACH ROW BEGIN :NEW.bsl_id := seq_bsl.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_BSL" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_BSL trigger para criar o id da BOLSA de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_ITE" BEFORE
INSERT
    ON INSTITUICOES_ENSINO FOR EACH ROW BEGIN :NEW.ite_id := seq_ite.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_ITE" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_ITE trigger para criar o id da INSTITUIÇÃO DE ENSINO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_CRS" BEFORE
INSERT
    ON CURSOS FOR EACH ROW BEGIN :NEW.crs_id := seq_crs.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_CRS" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_CRS trigger para criar o id do CURSO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_MDL" BEFORE
INSERT
    ON MODALIDADES FOR EACH ROW BEGIN :NEW.mdl_id := seq_mdl.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_MDL" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_MDL trigger para criar o id da MODALIDADE de acordo com a sequence
--------------------------------------------------------
    CREATE
    OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_TRN" BEFORE
    INSERT
        ON TURNOS_CURSO FOR EACH ROW BEGIN :NEW.trn_id := seq_trn.nextval;

    END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_TRN" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_BFN trigger para criar o id do TURNO DE CURSO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_TPB" BEFORE
INSERT
    ON TIPOS_BOLSA FOR EACH ROW BEGIN :NEW.tpb_id := seq_tpb.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_TPB" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_TPB trigger para criar o id do TIPO DE BOLSA de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_SEX" BEFORE
INSERT
    ON SEXOS FOR EACH ROW BEGIN :NEW.sex_id := seq_sex.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_SEX" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_SEX trigger para criar o id do SEXO DO BENEFICIARIO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_RCS" BEFORE
INSERT
    ON RACAS FOR EACH ROW BEGIN :NEW.rcs_id := seq_rcs.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_RCS" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_RCS trigger para criar o id da RACA de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_MUN" BEFORE
INSERT
    ON MUNICIPIOS FOR EACH ROW BEGIN :NEW.mun_id := seq_mun.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_MUN" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_MUN trigger para criar o id do MUNICIPIO de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_UFS" BEFORE
INSERT
    ON UFS FOR EACH ROW BEGIN :NEW.ufs_id := seq_ufs.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_UFS" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_UFS trigger para criar o id da UF de acordo com a sequence
--------------------------------------------------------
CREATE
OR REPLACE NONEDITIONABLE TRIGGER "APP_LAB"."TG_SEQ_RGS" BEFORE
INSERT
    ON REGIOES FOR EACH ROW BEGIN :NEW.rgs_id := seq_rgs.nextval;

END;

/ ALTER TRIGGER "APP_LAB"."TG_SEQ_RGS" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_RGS trigger para criar o id da REGIAO de acordo com a sequence
--------------------------------------------------------