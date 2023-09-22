SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_BOLSAS"(
    b_ano INTEGER,
    id_curso INTEGER,
    id_intituicao_ensino INTEGER,
    id_beneficiario INTEGER,
    id_tipo_bolsa INTEGER
) AS    v_count integer;
BEGIN
    SELECT  COUNT(*) INTO v_count 
    FROM    bolsas 
    WHERE   bsl_crs_id = id_curso
        AND bsl_bfn_id = id_beneficiario
        AND bsl_ano = b_ano
        AND bsl_ite_id = id_intituicao_ensino
        AND bsl_tpb_id = id_tipo_bolsa;
    IF v_count = 0 THEN
        INSERT INTO bolsas (bsl_ano
                        ,   bsl_crs_id
                        ,   bsl_ite_id
                        ,   bsl_bfn_id
                        ,   bsl_tpb_id) 
                    VALUES (b_ano
                        ,   id_curso
                        ,   id_intituicao_ensino
                        ,   id_beneficiario
                        ,   id_tipo_bolsa);
    END IF;
END UPSET_BOLSAS;