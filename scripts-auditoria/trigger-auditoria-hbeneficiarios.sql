create or replace NONEDITIONABLE TRIGGER TG_AUD_H_BENEFICIARIOS
    AFTER DELETE OR UPDATE
    ON HBENEFICIARIOS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HBENEFICIARIOS';
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

        IF :OLD.BNF_ID <> :NEW.BNF_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_ID',
                    operacao,
                    :OLD.BNF_ID,
                    :NEW.BNF_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BNF_CPF <> :NEW.BNF_CPF THEN
            APP_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_CPF',
                    operacao,
                    :OLD.BNF_CPF,
                    :NEW.BNF_CPF,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BNF_DT_NASC <> :NEW.BNF_DT_NASC THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_DT_NASC',
                    operacao,
                    :OLD.BNF_DT_NASC,
                    :NEW.BNF_DT_NASC,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BNF_DEFICIENTE_FISICO <> :NEW.BNF_DEFICIENTE_FISICO THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_DEFICIENTE_FISICO',
                    operacao,
                    :OLD.BNF_DEFICIENTE_FISICO,
                    :NEW.BNF_DEFICIENTE_FISICO,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BNF_SEX_ID <> :NEW.BNF_SEX_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_SEX_ID',
                    operacao,
                    :OLD.BNF_SEX_ID,
                    :NEW.BNF_SEX_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BNF_RCS_ID <> :NEW.BNF_RCS_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_RCS_ID',
                    operacao,
                    :OLD.BNF_RCS_ID,
                    :NEW.BNF_RCS_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.BNF_MUN_ID <> :NEW.BNF_MUN_ID THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_MUN_ID',
                    operacao,
                    :OLD.BNF_MUN_ID,
                    :NEW.BNF_MUN_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.BNF_DT_HIST <> :NEW.BNF_DT_HIST THEN
            APP_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'BNF_DT_HIST',
                    operacao,
                    :OLD.BNF_DT_HIST,
                    :NEW.BNF_DT_HIST,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;