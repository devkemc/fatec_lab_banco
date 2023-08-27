CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_SEXOS"(
    s_letra VARCHAR2,
    id_sexo OUT INTEGER
) AS    v_count integer;
BEGIN
    IF s_letra IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM sexos WHERE sex_letra = s_letra;
        IF v_count = 0 THEN
            INSERT INTO sexos (sex_letra) VALUES (s_letra)
            RETURNING sex_id INTO id_sexo;
        ELSE
            SELECT sex_id INTO id_sexo FROM sexos WHERE sex_letra = s_letra;
        END IF;
    END IF; 
END UPSET_SEXOS;