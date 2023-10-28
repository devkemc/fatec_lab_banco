-- Comandos sql para a criação das tabelas de historiamento

CREATE TABLE HBENEFICIARIOS
  (
    hbnf_id                NUMBER NOT NULL ,
    hbnf_cpf               CHAR (11) ,
    hbnf_dt_nasc           DATE ,
    hbnf_deficiente_fisico NUMBER ,
    hbnf_hsex_id           NUMBER NOT NULL ,
    hbnf_hrcs_id           NUMBER NOT NULL ,
    hbnf_hmun_id           NUMBER NOT NULL,
    hbnf_dt_entrada        DATE
  ) ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_id
IS
  'Armazena o valor historiado do identificador unico do beneficiario' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_cpf
IS
  'Armazena o valor historiado do cpf do beneficiario' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_dt_nasc
IS
  'Armazena a data historiada de nascimento do beneficiario' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_deficiente_fisico
IS
  'Armazena o valor historiado se o beneficiario e deficiente fisico' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hsex_id
IS
  'Armazena o valor historiado do identificador do unico do hsexo do beneficiario' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hrcs_id
IS
  'Armazena o valor historiado do identificador unico da raca do beneficiario' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hmun_id
IS
  'Armazena o valor historiado do identificador unico do municipio onde o beneficiario mora' ;
  COMMENT ON COLUMN HBENEFICIARIOS.hbnf_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela beneficiario' ;
ALTER TABLE HBENEFICIARIOS ADD CONSTRAINT HBNF_PK PRIMARY KEY ( hbnf_id, hbnf_dt_entrada ) ;



CREATE TABLE HBOLSAS
  (
    hbsl_id     NUMBER NOT NULL ,
    hbsl_ano    NUMBER ,
    hbsl_crs_id NUMBER NOT NULL ,
    hbsl_hite_id NUMBER NOT NULL ,
    hbsl_bnf_id NUMBER NOT NULL ,
    hbsl_htpb_id NUMBER NOT NULL,
    hbsl_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HBOLSAS.hbsl_id
IS
  'Armazena o valor historiado do identificador unico da bolsa' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_ano
IS
  'Armazena o valor historiado do ano que a bolsa foi concedida' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_crs_id
IS
  'Armazena o valor historiado do identificador unico do curso oferecido pela bolsa' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_hite_id
IS
  'Armazena o valor historiado do identificador unico da instituicao de ensino que ira ofertar a bolsa' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_bnf_id
IS
  'Armazena o valor historiado do identificador unico do beneficiario da bolsa' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_htpb_id
IS
  'Armazena o o valor historiado do identificador unico do tipo de bolsa' ;
  COMMENT ON COLUMN HBOLSAS.hbsl_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela Hbolsas' ;
ALTER TABLE HBOLSAS ADD CONSTRAINT HBSL_PK PRIMARY KEY ( hbsl_id, hbsl_dt_entrada ) ;



CREATE TABLE HCURSOS
  (
    hcrs_id     NUMBER NOT NULL ,
    hcrs_nome   VARCHAR2 (255) ,
    hcrs_hmdl_id NUMBER NOT NULL ,
    hcrs_htrn_id NUMBER NOT NULL,
    hcrs_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HCURSOS.hcrs_id
IS
  'Armazena o valor historiado do identificador unico do curso' ;
  COMMENT ON COLUMN HCURSOS.hcrs_nome
IS
  'Armazena o valor historiado do nome do curso' ;
  COMMENT ON COLUMN HCURSOS.hcrs_hmdl_id
IS
  'Armazena o valor historiado do identificador unico da modalidade do curso' ;
  COMMENT ON COLUMN HCURSOS.hcrs_htrn_id
IS
  'Armazena o valor historiado do identificador unico do turno do curso' ;
  COMMENT ON COLUMN HCURSOS.hcrs_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela curso' ;
ALTER TABLE HCURSOS ADD CONSTRAINT HCRS_PK PRIMARY KEY ( hcrs_id, hcrs_dt_entrada ) ;



CREATE TABLE HINSTITUICOES_ENSINO
  (
    hite_id   NUMBER NOT NULL ,
    hite_nome VARCHAR2 (255) NOT NULL,
    hite_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HINSTITUICOES_ENSINO.hite_id
IS
  'Armazena o valor historiado da instituicao de ensino' ;
  COMMENT ON COLUMN HINSTITUICOES_ENSINO.hite_nome
IS
  'Armazena o valor historiado do nome da instituicao de ensino' ;
  COMMENT ON COLUMN HINSTITUICOES_ENSINO.hite_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela instituicao de ensino' ;
ALTER TABLE HINSTITUICOES_ENSINO ADD CONSTRAINT HITE_PK PRIMARY KEY ( hite_id, hite_dt_entrada ) ;



CREATE TABLE HMODALIDADES
  ( 
    hmdl_id NUMBER NOT NULL , 
    hmdl_nome VARCHAR2 (50),
    hmdl_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HMODALIDADES.hmdl_id
IS
  'Armazena o valor historiado do identificador unico da modalidade do curso' ;
  COMMENT ON COLUMN HMODALIDADES.hmdl_nome
IS
  'Armazena o valor historiado do nome da modalidade de curso' ;
  COMMENT ON COLUMN HMODALIDADES.hmdl_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela modalidades' ;
ALTER TABLE HMODALIDADES ADD CONSTRAINT HMDL_PK PRIMARY KEY ( hmdl_id, hmdl_dt_entrada ) ;



CREATE TABLE HMUNICIPIOS
  (
    hmun_id     NUMBER NOT NULL ,
    hmun_nome   VARCHAR2 (255) ,
    hmun_ufs_id NUMBER NOT NULL,
    hmun_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HMUNICIPIOS.hmun_id
IS
  'Armazena o valor historiado do identificador unico do municipio' ;
  COMMENT ON COLUMN HMUNICIPIOS.hmun_nome
IS
  'Armazena o valor historiado do nome do municipio' ;
  COMMENT ON COLUMN HMUNICIPIOS.hmun_ufs_id
IS
  'Armazena o valor historiado do identificador unico da uf a qual o municipio pertence' ;
  COMMENT ON COLUMN HMUNICIPIOS.hmun_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela municipios' ;
ALTER TABLE HMUNICIPIOS ADD CONSTRAINT HMUN_PK PRIMARY KEY ( hmun_id, hmun_dt_entrada ) ;



CREATE TABLE HRACAS
  ( 
    hrcs_id NUMBER NOT NULL , 
    hrcs_nome VARCHAR2 (10),
    hrcs_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HRACAS.hrcs_id
IS
  'Armazena o valor historiado do identificador unico de racas' ;
  COMMENT ON COLUMN HRACAS.hrcs_nome
IS
  'Armazena o valor historiado do nome da raca cadastrada' ;
  COMMENT ON COLUMN HRACAS.hrcs_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela racas' ;
ALTER TABLE HRACAS ADD CONSTRAINT HRCS_PK PRIMARY KEY ( hrcs_id, hrcs_dt_entrada ) ;



CREATE TABLE HREGIOES
  ( 
    hrgs_id NUMBER NOT NULL , 
    hrgs_nome VARCHAR2 (12),
    hrgs_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HREGIOES.hrgs_id
IS
  'Armazena o valor historiado do identificador unico de regioes' ;
  COMMENT ON COLUMN HREGIOES.hrgs_nome
IS
  'Armazena o valor historiado do nome da regiao armazenada' ;
  COMMENT ON COLUMN HREGIOES.hrgs_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela regioes' ;
ALTER TABLE HREGIOES ADD CONSTRAINT HRGS_PK PRIMARY KEY ( hrgs_id, hrgs_dt_entrada ) ;



CREATE TABLE HSEXOS
  ( 
    hsex_id NUMBER NOT NULL , 
    hsex_letra CHAR (2) NOT NULL,
    hsex_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HSEXOS.hsex_id
IS
  'Armazena o valor historiado do identifcador unico de sexos' ;
  COMMENT ON COLUMN HSEXOS.hsex_letra
IS
  'Armazena o valor historiado da letra que identifica o sexo' ;
  COMMENT ON COLUMN HSEXOS.hsex_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela sexos' ;
ALTER TABLE HSEXOS ADD CONSTRAINT HSEX_PK PRIMARY KEY ( hsex_id, hsex_dt_entrada ) ;



CREATE TABLE HTIPOS_BOLSA
  ( 
    htpb_id NUMBER NOT NULL , 
    htpb_nome VARCHAR2 (50),
    htpb_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HTIPOS_BOLSA.htpb_id
IS
  'Armazena o valor historiado do identificador unico de tipos de bolsas' ;
  COMMENT ON COLUMN HTIPOS_BOLSA.htpb_nome
IS
  'Armazena o valor historiado do nome do tipo de bolsa cadastrado' ;
  COMMENT ON COLUMN HTIPOS_BOLSA.htpb_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela tipos_bolsa' ;
ALTER TABLE HTIPOS_BOLSA ADD CONSTRAINT HTIPOS_BOLSAAS_PK PRIMARY KEY ( htpb_id, htpb_dt_entrada ) ;



CREATE TABLE HTURNOS_CURSO
  (
    htrn_id   NUMBER NOT NULL ,
    htrn_nome VARCHAR2 (50),
    htrn_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HTURNOS_CURSO.htrn_id
IS
  'Armazena o valor historiado do identificador unico do turno de curso' ;
  COMMENT ON COLUMN HTURNOS_CURSO.htrn_nome
IS
  'Armazena o valor historiado do nome do turno de curso' ;
  COMMENT ON COLUMN HTURNOS_CURSO.htrn_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela turnos_curso' ;
ALTER TABLE HTURNOS_CURSO ADD CONSTRAINT HTRN_PK PRIMARY KEY ( htrn_id, htrn_dt_entrada ) ;



CREATE TABLE HUFS
  (
    hufs_id     NUMBER NOT NULL ,
    hufs_sigla  CHAR (2) ,
    hufs_rgs_id NUMBER NOT NULL,
    hufs_dt_entrada DATE
  ) ;
COMMENT ON COLUMN HUFS.hufs_id
IS
  'Armazena o valor historiado do identificador unico da uf' ;
  COMMENT ON COLUMN HUFS.hufs_sigla
IS
  'Armazena o valor historiado da sigla da uf' ;
  COMMENT ON COLUMN HUFS.hufs_rgs_id
IS
  'Armazena o valor historiado do identifcador unico da regiao a qual a uf pertence' ;
  COMMENT ON COLUMN HUFS.hufs_dt_entrada
IS
  'Armazena o valor historiado da data de entrada da modificacao na tabela ufs' ;
ALTER TABLE HUFS ADD CONSTRAINT HUFS_PK PRIMARY KEY ( hufs_id, hufs_dt_entrada ) ;