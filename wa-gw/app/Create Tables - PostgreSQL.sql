DROP TABLE IF EXISTS autorespon;

CREATE TABLE autorespon (
  profil bigint DEFAULT NULL,
  keyword varchar(100) NOT NULL,
  answer text,
  logic varchar(1) DEFAULT NULL,
  PRIMARY KEY (keyword)
)  ;

DROP TABLE IF EXISTS grab;

CREATE TABLE grab (
  profil int DEFAULT NULL,
  grup varchar(50) DEFAULT NULL,
  contact varchar(50) DEFAULT NULL,
  nama varchar(50) DEFAULT NULL
)  ;


DROP TABLE IF EXISTS grab_tmp;

CREATE TABLE grab_tmp (
  profil int NOT NULL,
  contact varchar(50) NOT NULL,
  nama varchar(50) DEFAULT NULL
)  ;


DROP TABLE IF EXISTS inbox;

CREATE SEQUENCE inbox_seq;

CREATE TABLE inbox (
  id bigint NOT NULL DEFAULT NEXTVAL ('inbox_seq'),
  wa_no varchar(200) NOT NULL,
  sub_no varchar(200) DEFAULT NULL,
  wa_text varchar(2000) NOT NULL,
  wa_time timestamp(0) NOT NULL,
  status varchar(5) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

CREATE INDEX id ON inbox (id);

DROP TABLE IF EXISTS multi;

CREATE SEQUENCE multi_seq;

CREATE TABLE multi (
  id bigint NOT NULL DEFAULT NEXTVAL ('multi_seq'),
  tipe varchar(1) DEFAULT NULL,
  profil varchar(20) DEFAULT NULL,
  wa_mode int DEFAULT NULL,
  wa_no varchar(200) NOT NULL,
  sub_no varchar(200) DEFAULT NULL,
  wa_text varchar(2000) NOT NULL,
  wa_media varchar(500) DEFAULT NULL,
  wa_file varchar(500) DEFAULT NULL,
  wa_time timestamp(0) NOT NULL DEFAULT NOW(),
  id_outbox bigint DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

 

DROP TABLE IF EXISTS outbox;

CREATE SEQUENCE outbox_seq;

CREATE TABLE outbox (
  id bigint NOT NULL DEFAULT NEXTVAL ('outbox_seq'),
  wa_mode int DEFAULT NULL,
  wa_no varchar(200) NOT NULL,
  wa_text varchar(2000) NOT NULL,
  wa_media varchar(500) DEFAULT NULL,
  wa_file varchar(500) DEFAULT NULL,
  wa_time timestamp(0) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
)  ;

 

DROP TABLE IF EXISTS sent;

CREATE TABLE sent (
  id bigint NOT NULL,
  wa_mode int DEFAULT NULL,
  wa_no varchar(200) NOT NULL,
  wa_text varchar(2000) NOT NULL,
  wa_media varchar(500) DEFAULT NULL,
  wa_file varchar(500) DEFAULT NULL,
  wa_time timestamp(0) NOT NULL DEFAULT NOW(),
  status varchar(5) DEFAULT NULL,
  PRIMARY KEY (id,wa_time)
)  ;

 

DROP TABLE IF EXISTS tesbot;

CREATE TABLE tesbot (
  kode varchar(10) DEFAULT NULL,
  nama varchar(50) DEFAULT NULL
) ;

 

DROP TABLE IF EXISTS tmp;

CREATE TABLE tmp (
  tmp_cd varchar(50) NOT NULL,
  tmp_val varchar(50) DEFAULT NULL,
  PRIMARY KEY (tmp_cd)
)  ;

 

DROP TABLE IF EXISTS web_user;

CREATE SEQUENCE web_user_seq;

CREATE TABLE web_user (
  id bigint NOT NULL DEFAULT NEXTVAL ('web_user_seq'),
  wa_user varchar(100) NOT NULL,
  wa_no varchar(30) NOT NULL,
  email varchar(100) NOT NULL,
  status varchar(1) DEFAULT 'Y',
  password varchar(20) DEFAULT NULL,
  create_dt timestamp(0) NOT NULL DEFAULT NOW(),
  last_login timestamp(0) DEFAULT NULL,
  qr varchar(500) DEFAULT NULL,
  bot_mode varchar(1) DEFAULT NULL,
  bot_url varchar(500) DEFAULT NULL,
  disable_read varchar(1) DEFAULT 'N',
  PRIMARY KEY (id)
)  ;