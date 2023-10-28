SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_CURSOS"(
    c_nome VARCHAR2,
    id_modalidade INTEGER,
    id_turno INTEGER,
    id_curso OUT INTEGER
) AS    v_count integer;
BEGIN
    SELECT COUNT(*) INTO v_count FROM cursos WHERE crs_nome = c_nome;
    IF v_count = 0 THEN
        INSERT INTO cursos (crs_nome, crs_mdl_id, crs_trn_id) VALUES (c_nome, id_modalidade, id_turno)
        RETURNING crs_id INTO id_curso;
    ELSE
        SELECT crs_id INTO id_curso FROM cursos WHERE crs_nome = c_nome;
    END IF;
END UPSET_CURSOS;