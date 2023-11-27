create or replace NONEDITIONABLE TRIGGER TG_AUD_H_CURSOS
    AFTER DELETE OR UPDATE
    ON HCURSOS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HCURSOS';
    operacao    CHAR(1);
BEGIN
    IF DELETING THEN
        operacao := 'D';
        APP_AUDITORIA.proc_insert_aud(
                :OLD.ROWID,
                SYSDATE,
                nome_tabela,
                NULL,
                operacao,
                NULL,
                NULL,
                usuario_bd,
                usuario_so
            );
    ELSE
        operacao := 'U';

        IF :OLD.CRS_ID <> :NEW.CRS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'CRS_ID',
                    operacao,
                    :OLD.CRS_ID,
                    :NEW.CRS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.CRS_NOME <> :NEW.CRS_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'CRS_NOME',
                    operacao,
                    :OLD.CRS_NOME,
                    :NEW.CRS_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.CRS_MDL_ID <> :NEW.CRS_MDL_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'CRS_MDL_ID',
                    operacao,
                    :OLD.CRS_MDL_ID,
                    :NEW.CRS_MDL_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.CRS_TRN_ID <> :NEW.CRS_TRN_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'CRS_TRN_ID',
                    operacao,
                    :OLD.CRS_TRN_ID,
                    :NEW.CRS_TRN_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.CRS_DT_HIST <> :NEW.CRS_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'CRS_DT_HIST',
                    operacao,
                    :OLD.CRS_DT_HIST,
                    :NEW.CRS_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;