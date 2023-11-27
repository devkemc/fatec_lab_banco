create or replace NONEDITIONABLE TRIGGER TG_AUD_H_TIPOS_BOLSA
    AFTER DELETE OR UPDATE
    ON HTIPOS_BOLSA
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HTIPOS_BOLSA';
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

        IF :OLD.TPB_ID <> :NEW.TPB_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'TPB_ID',
                    operacao,
                    :OLD.TPB_ID,
                    :NEW.TPB_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.TPB_NOME <> :NEW.TPB_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'TPB_NOME',
                    operacao,
                    :OLD.TPB_NOME,
                    :NEW.TPB_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.TPB_DT_HIST <> :NEW.TPB_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'TPB_DT_HIST',
                    operacao,
                    :OLD.TPB_DT_HIST,
                    :NEW.TPB_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;