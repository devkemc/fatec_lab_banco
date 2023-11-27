create or replace NONEDITIONABLE TRIGGER TG_AUD_H_UFS
    AFTER DELETE OR UPDATE
    ON HUFS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HUFS';
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

        IF :OLD.UFS_ID <> :NEW.UFS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'UFS_ID',
                    operacao,
                    :OLD.UFS_ID,
                    :NEW.UFS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.UFS_SIGLA <> :NEW.UFS_SIGLA THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'UFS_SIGLA',
                    operacao,
                    :OLD.UFS_SIGLA,
                    :NEW.UFS_SIGLA,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.UFS_RGS_ID <> :NEW.UFS_RGS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'UFS_RGS_ID',
                    operacao,
                    :OLD.UFS_RGS_ID,
                    :NEW.UFS_RGS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.UFS_DT_HIST <> :NEW.UFS_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'UFS_DT_HIST',
                    operacao,
                    :OLD.UFS_DT_HIST,
                    :NEW.UFS_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;