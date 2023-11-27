create or replace NONEDITIONABLE TRIGGER TG_AUD_H_SEXOS
    AFTER DELETE OR UPDATE
    ON HSEXOS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HINSTITUICOES_ENSINO';
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

        IF :OLD.SEX_ID <> :NEW.SEX_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'SEX_ID',
                    operacao,
                    :OLD.SEX_ID,
                    :NEW.SEX_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.SEX_LETRA <> :NEW.SEX_LETRA THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'SEX_LETRA',
                    operacao,
                    :OLD.SEX_LETRA,
                    :NEW.SEX_LETRA,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.SEX_DT_HIST <> :NEW.SEX_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'SEX_DT_HIST',
                    operacao,
                    :OLD.SEX_DT_HIST,
                    :NEW.SEX_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;