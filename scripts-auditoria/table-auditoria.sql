

CREATE TABLE AUDITORIA
  (
    aud_id          NUMBER NOT NULL ,
    aud_registro_id NUMBER ,
    aud_data        DATE ,
    aud_nome_tabela VARCHAR2 (30) ,
    aud_nome_coluna VARCHAR2 (30) ,
    aud_operacao    CHAR (1) ,
    aud_val_antigo  VARCHAR2 (2000) ,
    aud_val_novo    VARCHAR2 (2000) ,
    aud_usuario_bd  VARCHAR2 (200) ,
    aud_usuario_so  VARCHAR2 (200)
  ) ;
ALTER TABLE AUDITORIA ADD CONSTRAINT AUDITORIA_PK PRIMARY KEY ( aud_id ) ;