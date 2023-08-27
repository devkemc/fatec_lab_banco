CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_BENEFICIARIOS"(
    b_cpf VARCHAR2,
    b_data_nascimento VARCHAR2,
    b_deficiente VARCHAR2,
    b_id_raca INTEGER,
    b_id_sexo INTEGER,
    b_id_municipio INTEGER,
    id_beneficiario OUT INTEGER
) AS    v_count integer;
        b_e_deficiente NUMBER;
        dt_nasc Date;
BEGIN
    IF b_cpf IS NOT NULL THEN
        IF b_deficiente = 'sim' THEN
            b_e_deficiente := 1;
        ELSE
            b_e_deficiente := 0;
        END IF;
        IF b_data_nascimento IS NOT NULL THEN
           BEGIN
                dt_nasc := TO_DATE(b_data_nascimento, 'YYYY-MM-DD HH24:MI:SS');
            EXCEPTION
                WHEN OTHERS THEN
                    dt_nasc := TO_DATE(b_data_nascimento, 'YYYY-MM-DD');
            END;
        END IF;
        SELECT COUNT(*) INTO v_count FROM beneficiarios WHERE bnf_cpf = b_cpf;
        IF v_count = 0 THEN
            INSERT INTO beneficiarios (bnf_cpf, bnf_dt_nasc, bnf_deficiente_fisico, bnf_sex_id, bnf_rcs_id, bnf_mun_id) 
                               VALUES (b_cpf, dt_nasc, b_e_deficiente, b_id_sexo, b_id_raca, b_id_municipio)
                RETURNING bnf_id INTO id_beneficiario;
        ELSE
             SELECT bnf_id INTO id_beneficiario FROM beneficiarios WHERE bnf_cpf = b_cpf;
        END IF;
    END IF; 
END UPSET_BENEFICIARIOS;