BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE autorespon';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE autorespon (
  profil number(19) DEFAULT NULL,
  keyword varchar2(100) NOT NULL,
  answer varchar(max),
  logic varchar2(1) DEFAULT NULL,
  PRIMARY KEY (keyword)
)  ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE grab';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE grab (
  profil number(10) DEFAULT NULL,
  grup varchar2(50) DEFAULT NULL,
  contact varchar2(50) DEFAULT NULL,
  nama varchar2(50) DEFAULT NULL
)  ;


BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE grab_tmp';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE grab_tmp (
  profil number(10) NOT NULL,
  contact varchar2(50) NOT NULL,
  nama varchar2(50) DEFAULT NULL
)  ;


BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE inbox';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE inbox (
  id number(19) NOT NULL,
  wa_no varchar2(200) NOT NULL,
  sub_no varchar2(200) DEFAULT NULL,
  wa_text varchar2(2000) NOT NULL,
  wa_time datetime2(0) NOT NULL,
  status varchar2(5) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;
  
-- Generate ID using sequence and trigger
  CREATE SEQUENCE inbox_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER inbox_seq_tr
 BEFORE INSERT ON inbox FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT inbox_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE INDEX id ON inbox (id);

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE multi';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE multi (
  id number(19) NOT NULL,
  tipe varchar2(1) DEFAULT NULL,
  profil varchar2(20) DEFAULT NULL,
  wa_mode number(10) DEFAULT NULL,
  wa_no varchar2(200) NOT NULL,
  sub_no varchar2(200) DEFAULT NULL,
  wa_text varchar2(2000) NOT NULL,
  wa_media varchar2(500) DEFAULT NULL,
  wa_file varchar2(500) DEFAULT NULL,
  wa_time datetime2(0) DEFAULT SYSTIMESTAMP NOT NULL ,
  id_outbox number(19) DEFAULT NULL,
  status varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;
  
-- Generate ID using sequence and trigger
  CREATE SEQUENCE multi_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER multi_seq_tr
 BEFORE INSERT ON multi FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT multi_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE outbox';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE outbox (
  id number(19) NOT NULL,
  wa_mode number(10) DEFAULT NULL,
  wa_no varchar2(200) NOT NULL,
  wa_text varchar2(2000) NOT NULL,
  wa_media varchar2(500) DEFAULT NULL,
  wa_file varchar2(500) DEFAULT NULL,
  wa_time datetime2(0) DEFAULT SYSTIMESTAMP NOT NULL ,
  PRIMARY KEY (id)
)  ;
  
-- Generate ID using sequence and trigger
  CREATE SEQUENCE outbox_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER outbox_seq_tr
 BEFORE INSERT ON outbox FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT outbox_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE sent';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE sent (
  id number(19) NOT NULL,
  wa_mode number(10) DEFAULT NULL,
  wa_no varchar2(200) NOT NULL,
  wa_text varchar2(2000) NOT NULL,
  wa_media varchar2(500) DEFAULT NULL,
  wa_file varchar2(500) DEFAULT NULL,
  wa_time datetime2(0) DEFAULT SYSTIMESTAMP NOT NULL ,
  status varchar2(5) DEFAULT NULL,
  PRIMARY KEY (id,wa_time)
)  ;

 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE tesbot';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE tesbot (
  kode varchar2(10) DEFAULT NULL,
  nama varchar2(50) DEFAULT NULL
) ;

 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE tmp';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE tmp (
  tmp_cd varchar2(50) NOT NULL,
  tmp_val varchar2(50) DEFAULT NULL,
  PRIMARY KEY (tmp_cd)
)  ;

 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE web_user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE web_user (
  id number(19) NOT NULL,
  wa_user varchar2(100) NOT NULL,
  wa_no varchar2(30) NOT NULL,
  email varchar2(100) NOT NULL,
  status varchar2(1) DEFAULT 'Y',
  password varchar2(20) DEFAULT NULL,
  create_dt datetime2(0) DEFAULT SYSTIMESTAMP NOT NULL ,
  last_login datetime2(0) DEFAULT NULL,
  qr varchar2(500) DEFAULT NULL,
  bot_mode varchar2(1) DEFAULT NULL,
  bot_url varchar2(500) DEFAULT NULL,
  disable_read varchar2(1) DEFAULT 'N',
  PRIMARY KEY (id)
)  ;
  
-- Generate ID using sequence and trigger
  CREATE SEQUENCE web_user_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER web_user_seq_tr
 BEFORE INSERT ON web_user FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT web_user_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/