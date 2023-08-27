SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_UFS"(
    sigla VARCHAR2,
    id_regiao integer,
    uf_id OUT INTEGER
) AS    v_count integer;
BEGIN
    IF sigla IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM ufs WHERE ufs_sigla = sigla;
        IF v_count = 0 THEN
            INSERT INTO ufs (ufs_sigla, ufs_rgs_id) VALUES (sigla, id_regiao)
            RETURNING ufs_id INTO uf_id;
        ELSE
             SELECT ufs_id INTO uf_id FROM ufs WHERE ufs_sigla = sigla;
        END IF;
    END IF;
END UPSET_UFS;