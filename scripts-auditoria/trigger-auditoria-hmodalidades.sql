create or replace NONEDITIONABLE TRIGGER TG_AUD_H_MODALIDADES
    AFTER DELETE OR UPDATE
    ON HMODALIDADES
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HMODALIDADES';
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

        IF :OLD.MDL_ID <> :NEW.MDL_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MDL_ID',
                    operacao,
                    :OLD.MDL_ID,
                    :NEW.MDL_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.MDL_NOME <> :NEW.MDL_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MDL_NOME',
                    operacao,
                    :OLD.MDL_NOME,
                    :NEW.MDL_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.MDL_DT_HIST <> :NEW.MDL_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MDL_DT_HIST',
                    operacao,
                    :OLD.MDL_DT_HIST,
                    :NEW.MDL_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;