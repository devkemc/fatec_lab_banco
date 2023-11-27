create or replace NONEDITIONABLE TRIGGER TG_AUD_H_MUNICIPIOS
    AFTER DELETE OR UPDATE
    ON HMUNICIPIOS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HMUNICIPIOS';
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

        IF :OLD.MUN_ID <> :NEW.MUN_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MUN_ID',
                    operacao,
                    :OLD.MUN_ID,
                    :NEW.MUN_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.MUN_NOME <> :NEW.MUN_NOME THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MUN_NOME',
                    operacao,
                    :OLD.MUN_NOME,
                    :NEW.MUN_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.MUN_UFS_ID <> :NEW.MUN_UFS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MUN_UFS_ID',
                    operacao,
                    :OLD.MUN_UFS_ID,
                    :NEW.MUN_UFS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.MUN_DT_HIST <> :NEW.MUN_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'MUN_DT_HIST',
                    operacao,
                    :OLD.MUN_DT_HIST,
                    :NEW.MUN_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;