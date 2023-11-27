create or replace NONEDITIONABLE TRIGGER TG_AUD_H_RACAS
    AFTER DELETE OR UPDATE
    ON HRACAS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HRACAS';
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

        IF :OLD.RCS_ID <> :NEW.RCS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RCS_ID',
                    operacao,
                    :OLD.RCS_ID,
                    :NEW.RCS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.RCS_NOME <> :NEW.RCS_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RCS_NOME',
                    operacao,
                    :OLD.RCS_NOME,
                    :NEW.RCS_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.RCS_DT_HIST <> :NEW.RCS_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RCS_DT_HIST',
                    operacao,
                    :OLD.RCS_DT_HIST,
                    :NEW.RCS_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;