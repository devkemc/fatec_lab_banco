SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_MUNICIPIOS"(
    m_nome VARCHAR2,
    uf_id integer,
    municipio_id OUT INTEGER
) AS    v_count integer;
BEGIN
    IF m_nome IS NOT NULL THEN
         SELECT COUNT(*) INTO v_count FROM municipios WHERE mun_nome = m_nome;
        IF v_count = 0 THEN
            INSERT INTO municipios (mun_nome, mun_ufs_id) VALUES (m_nome, uf_id)
            RETURNING mun_id INTO municipio_id;
        ELSE
             SELECT mun_id INTO municipio_id FROM municipios WHERE mun_nome = m_nome;
        END IF;
    END IF;
   
END UPSET_MUNICIPIOS;