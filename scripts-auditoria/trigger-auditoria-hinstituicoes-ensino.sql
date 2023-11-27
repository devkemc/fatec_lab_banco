create or replace NONEDITIONABLE TRIGGER TG_AUD_H_INSTITUICOES_ENSINO
    AFTER DELETE OR UPDATE
    ON HINSTITUICOES_ENSINO
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

        IF :OLD.ITE_ID <> :NEW.ITE_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'ITE_ID',
                    operacao,
                    :OLD.ITE_ID,
                    :NEW.ITE_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.ITE_NOME <> :NEW.ITE_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'ITE_NOME',
                    operacao,
                    :OLD.ITE_NOME,
                    :NEW.ITE_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.ITE_DT_HIST <> :NEW.ITE_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'ITE_DT_HIST',
                    operacao,
                    :OLD.ITE_DT_HIST,
                    :NEW.ITE_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;