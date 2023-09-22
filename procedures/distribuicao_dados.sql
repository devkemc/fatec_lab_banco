
create or replace NONEDITIONABLE PROCEDURE "DISTRIBUI_DADOS" AS 
id_regiao integer;
id_uf integer;
id_municipio integer;
id_raca integer;
id_sexo integer;
id_beneficiario integer;
id_insituicao_ensino integer;
id_modalidade integer;
id_turno_curso integer;
id_curso integer;
id_tipo_bolsa integer;
BEGIN
  FOR DADO IN (SELECT * FROM PROUNI) LOOP

    -- INSERÇÃO BENEFICIARIO
    UPSET_REGIOES(DADO.REGIAO_BENEFICIARIO_BOLSA, id_regiao);
    IF id_regiao IS NULL THEN
        CONTINUE;
    END IF;
    UPSET_UFS(DADO.SIGLA_UF_BENEFICIARIO_BOLSA, id_regiao, id_uf);
    IF id_uf IS NULL THEN
        CONTINUE;
    END IF;
    UPSET_MUNICIPIOS(DADO.MUNICIPIO_BENEFICIARIO_BOLSA, id_uf, id_municipio);
    IF id_municipio IS NULL THEN
        CONTINUE;
    END IF;
    UPSET_RACAS(DADO.RACA_BENEFICIARIO_BOLSA, id_raca);
    UPSET_SEXOS(DADO.SEXO_BENEFICIARIO_BOLSA, id_sexo);
    IF id_raca IS NULL OR id_sexo IS NULL OR id_municipio IS NULL THEN
        CONTINUE;
    END IF;
    UPSET_BENEFICIARIOS(DADO.CPF_BENEFICIARIO_BOLSA, DADO.DT_NASCIMENTO_BENEFICIARIO, DADO.BENEFICIARIO_DEFICIENTE_FISICO, id_raca, id_sexo, id_municipio, id_beneficiario);
    -- INSERÇÃO BENEFICIARIO
    
    -- INSERÇÃO CURSO
    UPSET_MODALIDADES(DADO.MODALIDADE_ENSINO_BOLSA, id_modalidade);
    UPSET_TURNOS(DADO.NOME_TURNO_CURSO_BOLSA, id_turno_curso);

    IF id_modalidade IS NOT NULL AND id_turno_curso IS NOT NULL THEN
        UPSET_CURSOS(DADO.NOME_CURSO_BOLSA, id_modalidade, id_turno_curso, id_curso);
    END IF;
    -- INSERÇÃO CURSO

    -- INSERÇÃO INSTITUIÇÃO DE ENSINO
    UPSET_INTITUICOES_ENSINO(DADO.NOME_IES_BOLSA, id_insituicao_ensino);
    -- INSERÇÃO INSTITUIÇÃO DE ENSINO

    -- INSERÇÃO BOLSA
    UPSET_TIPOS_BOLSA(DADO.TIPO_BOLSA, id_tipo_bolsa);
    IF id_curso IS NULL OR id_insituicao_ensino IS NULL OR id_beneficiario IS NULL OR id_tipo_bolsa IS NOT NULL THEN
        CONTINUE;
    END IF;
    UPSET_BOLSAS(DADO.ANO_CONCESSAO_BOLSA, id_curso, id_insituicao_ensino, id_beneficiario, id_tipo_bolsa);
    -- INSERÇÃO BOLSA
  END LOOP;  
END DISTRIBUI_DADOS;