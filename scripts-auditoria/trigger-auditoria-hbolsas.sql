create or replace NONEDITIONABLE TRIGGER TG_AUD_H_BOLSAS
    AFTER DELETE OR UPDATE
    ON HBOLSAS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HBOLSAS';
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

        IF :OLD.BSL_ID <> :NEW.BSL_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_ID',
                    operacao,
                    :OLD.BSL_ID,
                    :NEW.BSL_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BSL_ANO <> :NEW.BSL_ANO THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_ANO',
                    operacao,
                    :OLD.BSL_ANO,
                    :NEW.BSL_ANO,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BSL_CRS_ID <> :NEW.BSL_CRS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_CRS_ID',
                    operacao,
                    :OLD.BSL_CRS_ID,
                    :NEW.BSL_CRS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BSL_ITE_ID <> :NEW.BSL_ITE_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_ITE_ID',
                    operacao,
                    :OLD.BSL_ITE_ID,
                    :NEW.BSL_ITE_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BSL_BNF_ID <> :NEW.BSL_BNF_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_BNF_ID',
                    operacao,
                    :OLD.BSL_BNF_ID,
                    :NEW.BSL_BNF_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BSL_TPB_ID <> :NEW.BSL_TPB_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_TPB_ID',
                    operacao,
                    :OLD.BSL_TPB_ID,
                    :NEW.BSL_TPB_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BSL_DT_HIST <> :NEW.BSL_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BSL_DT_HIST',
                    operacao,
                    :OLD.BSL_DT_HIST,
                    :NEW.BSL_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;

    END IF;
END;