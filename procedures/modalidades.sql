SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_MODALIDADES"(
    m_nome VARCHAR2,
    id_modalidade OUT INTEGER
) AS    v_count integer;
BEGIN
    IF m_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM modalidades WHERE mdl_nome = m_nome;
        IF v_count = 0 THEN
            INSERT INTO modalidades (mdl_nome) VALUES (m_nome)
            RETURNING mdl_id INTO id_modalidade;
        ELSE
            SELECT mdl_id INTO id_modalidade FROM modalidades WHERE mdl_nome = m_nome;
        END IF;
    END IF;
END UPSET_MODALIDADES;