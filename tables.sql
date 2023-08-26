-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2023-08-26 12:44:50 BRT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c




CREATE TABLE BENEFICIARIOS
  (
    bnf_id                NUMBER NOT NULL ,
    bnf_cpf               CHAR (11) ,
    bnf_dt_nasc           DATE ,
    bnf_deficiente_fisico NUMBER ,
    bnf_sex_id            NUMBER NOT NULL ,
    bnf_rcs_id            NUMBER NOT NULL ,
    bnf_mun_id            NUMBER NOT NULL
  ) ;
COMMENT ON COLUMN BENEFICIARIOS.bnf_id
IS
  'Armazena o identificador unico do beneficiario' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_cpf
IS
  'Armazena cpf do beneficiario' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_dt_nasc
IS
  'Armazena data de nascimento do beneficiario' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_deficiente_fisico
IS
  'Armazena se o beneficiario e deficiente fisico' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_sex_id
IS
  'Armazena identificador unico do sexo do beneficiario' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_rcs_id
IS
  'Armazena identificador unico da raca do beneficiario' ;
  COMMENT ON COLUMN BENEFICIARIOS.bnf_mun_id
IS
  'Armazena identificador unico do municipio onde o beneficiario mora' ;
ALTER TABLE BENEFICIARIOS ADD CONSTRAINT BNF_PK PRIMARY KEY ( bnf_id ) ;


CREATE TABLE BOLSAS
  (
    bsl_id     NUMBER NOT NULL ,
    bsl_ano    DATE ,
    bsl_crs_id NUMBER NOT NULL ,
    bsl_ite_id NUMBER NOT NULL ,
    bsl_bfn_id NUMBER NOT NULL ,
    bsl_tpb_id NUMBER NOT NULL
  ) ;
COMMENT ON COLUMN BOLSAS.bsl_id
IS
  'Armazena o identificador unico da bolsa' ;
  COMMENT ON COLUMN BOLSAS.bsl_ano
IS
  'Armazena ano que a bolsa foi concedida' ;
  COMMENT ON COLUMN BOLSAS.bsl_crs_id
IS
  'Armazena identificador unico do curso oferecido pela bolsa' ;
  COMMENT ON COLUMN BOLSAS.bsl_ite_id
IS
  'Armazena identificador unico da instituicao de ensino que ira ofertar a bolsa' ;
  COMMENT ON COLUMN BOLSAS.bsl_bfn_id
IS
  'Armazena o identificador unico do beneficiario da bolsa' ;
  COMMENT ON COLUMN BOLSAS.bsl_tpb_id
IS
  'Armazena o identificador unico do tipo de bolsa' ;
ALTER TABLE BOLSAS ADD CONSTRAINT BSL_PK PRIMARY KEY ( bsl_id ) ;


CREATE TABLE CURSOS
  (
    crs_id     NUMBER NOT NULL ,
    crs_nome   VARCHAR2 (255) ,
    crs_mdl_id NUMBER NOT NULL ,
    crs_trn_id NUMBER NOT NULL
  ) ;
COMMENT ON COLUMN CURSOS.crs_id
IS
  'Armazena identificador unico do curso' ;
  COMMENT ON COLUMN CURSOS.crs_nome
IS
  'Armazena nome do curso' ;
  COMMENT ON COLUMN CURSOS.crs_mdl_id
IS
  'Armazena identificador unico da modalidade do curso' ;
  COMMENT ON COLUMN CURSOS.crs_trn_id
IS
  'Armazena identificador unico do turno do curso' ;
ALTER TABLE CURSOS ADD CONSTRAINT CRS_PK PRIMARY KEY ( crs_id ) ;


CREATE TABLE INSTITUICOES_ENSINO
  (
    ite_id   NUMBER NOT NULL ,
    ite_nome VARCHAR2 (255) NOT NULL
  ) ;
COMMENT ON COLUMN INSTITUICOES_ENSINO.ite_id
IS
  'Armazena identificador unico da instituicao de ensino' ;
  COMMENT ON COLUMN INSTITUICOES_ENSINO.ite_nome
IS
  'Armazena nome da instituicao de ensino' ;
ALTER TABLE INSTITUICOES_ENSINO ADD CONSTRAINT ITE_PK PRIMARY KEY ( ite_id ) ;


CREATE TABLE MODALIDADES
  ( mdl_id NUMBER NOT NULL , mdl_nome VARCHAR2 (50)
  ) ;
COMMENT ON COLUMN MODALIDADES.mdl_id
IS
  'Armazena identificador unico da modalidade do curso' ;
  COMMENT ON COLUMN MODALIDADES.mdl_nome
IS
  'Armazena nome da modalidade de curso' ;
ALTER TABLE MODALIDADES ADD CONSTRAINT MDL_PK PRIMARY KEY ( mdl_id ) ;


CREATE TABLE MUNICIPIOS
  (
    mun_id     NUMBER NOT NULL ,
    mun_nome   VARCHAR2 (255) ,
    mun_ufs_id NUMBER NOT NULL
  ) ;
COMMENT ON COLUMN MUNICIPIOS.mun_id
IS
  'Armazena identificador unico do municipio' ;
  COMMENT ON COLUMN MUNICIPIOS.mun_nome
IS
  'Armazena nome do municipio' ;
  COMMENT ON COLUMN MUNICIPIOS.mun_ufs_id
IS
  'Armazena identificador unico da uf a qual o municipio pertence' ;
ALTER TABLE MUNICIPIOS ADD CONSTRAINT MUN_PK PRIMARY KEY ( mun_id ) ;


CREATE TABLE RACAS
  ( rcs_id NUMBER NOT NULL , rcs_nome VARCHAR2 (10)
  ) ;
COMMENT ON COLUMN RACAS.rcs_id
IS
  'armazena identificador unico de regioes' ;
  COMMENT ON COLUMN RACAS.rcs_nome
IS
  'Armazena nome da raca cadastrada' ;
ALTER TABLE RACAS ADD CONSTRAINT RCS_PK PRIMARY KEY ( rcs_id ) ;


CREATE TABLE REGIOES
  ( rgs_id NUMBER NOT NULL , rgs_nome VARCHAR2 (8)
  ) ;
COMMENT ON COLUMN REGIOES.rgs_id
IS
  'Armazena o identificador unico de regioes' ;
  COMMENT ON COLUMN REGIOES.rgs_nome
IS
  'Armazena nome da tegiao armazenada' ;
ALTER TABLE REGIOES ADD CONSTRAINT RGS_PK PRIMARY KEY ( rgs_id ) ;


CREATE TABLE SEXOS
  ( sex_id NUMBER NOT NULL , sex_letra CHAR (2) NOT NULL
  ) ;
COMMENT ON COLUMN SEXOS.sex_id
IS
  'Armazena identifcador unico de sexos' ;
  COMMENT ON COLUMN SEXOS.sex_letra
IS
  'Armazena a letra que identifica o sexo' ;
ALTER TABLE SEXOS ADD CONSTRAINT SEX_PK PRIMARY KEY ( sex_id ) ;


CREATE TABLE TIPOS_BOLSA
  ( tpb_id NUMBER NOT NULL , tpb_nome VARCHAR2 (50)
  ) ;
COMMENT ON COLUMN TIPOS_BOLSA.tpb_id
IS
  'Armazena identificador unico de tipos de bolsas' ;
  COMMENT ON COLUMN TIPOS_BOLSA.tpb_nome
IS
  'Armazena nome do tipo de bolsa cadastrado' ;
ALTER TABLE TIPOS_BOLSA ADD CONSTRAINT TIPOS_BOLSAAS_PK PRIMARY KEY ( tpb_id ) ;


CREATE TABLE TURNOS_CURSO
  (
    trn_id   NUMBER NOT NULL ,
    trn_nome VARCHAR2 (50)
  ) ;
COMMENT ON COLUMN TURNOS_CURSO.trn_id
IS
  'Armazena identificador unico do turno de curso' ;
  COMMENT ON COLUMN TURNOS_CURSO.trn_nome
IS
  'Armazena o nome do turno de curso' ;
ALTER TABLE TURNOS_CURSO ADD CONSTRAINT TRN_PK PRIMARY KEY ( trn_id ) ;


CREATE TABLE UFS
  (
    ufs_id     NUMBER NOT NULL ,
    ufs_sigla  CHAR (2) ,
    ufs_rgs_id NUMBER NOT NULL
  ) ;
COMMENT ON COLUMN UFS.ufs_id
IS
  'Armazena identificador unico da uf' ;
  COMMENT ON COLUMN UFS.ufs_sigla
IS
  'Armazena a sigla da uf' ;
  COMMENT ON COLUMN UFS.ufs_rgs_id
IS
  'Armazena o identifcador unico da regiao a qual a uf pertence' ;
ALTER TABLE UFS ADD CONSTRAINT UFS_PK PRIMARY KEY ( ufs_id ) ;

