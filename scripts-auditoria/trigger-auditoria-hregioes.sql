create or replace NONEDITIONABLE TRIGGER TG_AUD_H_REGIOES
    AFTER DELETE OR UPDATE
    ON HREGIOES
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HREGIOES';
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

        IF :OLD.RGS_ID <> :NEW.RGS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RGS_ID',
                    operacao,
                    :OLD.RGS_ID,
                    :NEW.RGS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.RGS_NOME <> :NEW.RGS_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RGS_NOME',
                    operacao,
                    :OLD.RGS_NOME,
                    :NEW.RGS_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.RGS_DT_HIST <> :NEW.RGS_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'RGS_DT_HIST',
                    operacao,
                    :OLD.RGS_DT_HIST,
                    :NEW.RGS_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;