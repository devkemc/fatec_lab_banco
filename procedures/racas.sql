CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_RACAS"(
    r_nome VARCHAR2,
    id_raca OUT INTEGER
) AS    v_count integer;
BEGIN
    IF r_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM racas WHERE rcs_nome = r_nome;
        IF v_count = 0 THEN
            INSERT INTO racas (rcs_nome) VALUES (r_nome)
            RETURNING rcs_id INTO id_raca;
        ELSE
            SELECT rcs_id INTO id_raca FROM racas WHERE rcs_nome = r_nome;
        END IF;
    END IF; 
END UPSET_RACAS;