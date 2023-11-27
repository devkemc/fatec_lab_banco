CREATE OR REPLACE PROCEDURE proc_insert_aud(
    a_aud_registro_id IN VARCHAR2,
    a_aud_data IN DATE,
    a_aud_tabela IN VARCHAR,
    a_aud_coluna IN VARCHAR,
    a_aud_operacao IN CHAR,
    a_aud_val_antigo IN VARCHAR,
    a_aud_val_novo IN VARCHAR,
    a_aud_user_bd IN VARCHAR,
    a_aud_user_so IN VARCHAR
) AS
BEGIN
    INSERT INTO AUDITORIA
    VALUES (null,
            a_aud_registro_id,
            a_aud_data,
            a_aud_tabela,
            a_aud_coluna,
            a_aud_operacao,
            a_aud_val_antigo,
            a_aud_val_novo,
            a_aud_user_bd,
            a_aud_user_so);
END proc_insert_aud;

GRANT EXECUTE ON AUDITORIA.proc_insert_aud TO APP_LAB;