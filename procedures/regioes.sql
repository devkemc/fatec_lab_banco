SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_REGIOES"(
    r_nome VARCHAR2,
    regiao_id OUT INTEGER
) AS    v_count integer;
BEGIN
    IF r_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM regioes WHERE rgs_nome = r_nome;
        IF v_count = 0 THEN
            INSERT INTO regioes (rgs_nome) VALUES (r_nome)
            RETURNING rgs_id INTO regiao_id;
        ELSE
            SELECT rgs_id INTO regiao_id FROM regioes WHERE rgs_nome = r_nome;
        END IF;
    END IF;
END UPSET_REGIOES;