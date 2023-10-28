DROP TABLE IF EXISTS [autorespon];

CREATE TABLE autorespon (
  [profil] bigint DEFAULT NULL,
  [keyword] varchar(100) NOT NULL,
  [answer] varchar(max),
  [logic] varchar(1) DEFAULT NULL,
  PRIMARY KEY ([keyword])
)  ;

DROP TABLE IF EXISTS [grab];

CREATE TABLE grab (
  [profil] int DEFAULT NULL,
  [grup] varchar(50) DEFAULT NULL,
  [contact] varchar(50) DEFAULT NULL,
  [nama] varchar(50) DEFAULT NULL
)  ;


DROP TABLE IF EXISTS [grab_tmp];

CREATE TABLE grab_tmp (
  [profil] int NOT NULL,
  [contact] varchar(50) NOT NULL,
  [nama] varchar(50) DEFAULT NULL
)  ;


DROP TABLE IF EXISTS [inbox];

CREATE TABLE inbox (
  [id] bigint NOT NULL IDENTITY,
  [wa_no] varchar(200) NOT NULL,
  [sub_no] varchar(200) DEFAULT NULL,
  [wa_text] varchar(2000) NOT NULL,
  [wa_time] datetime2(0) NOT NULL,
  [status] varchar(5) DEFAULT NULL,
  PRIMARY KEY ([id])
)  ;

CREATE INDEX [id] ON inbox ([id]);

DROP TABLE IF EXISTS [multi];

CREATE TABLE multi (
  [id] bigint NOT NULL IDENTITY,
  [tipe] varchar(1) DEFAULT NULL,
  [profil] varchar(20) DEFAULT NULL,
  [wa_mode] int DEFAULT NULL,
  [wa_no] varchar(200) NOT NULL,
  [sub_no] varchar(200) DEFAULT NULL,
  [wa_text] varchar(2000) NOT NULL,
  [wa_media] varchar(500) DEFAULT NULL,
  [wa_file] varchar(500) DEFAULT NULL,
  [wa_time] datetime2(0) NOT NULL DEFAULT GETDATE(),
  [id_outbox] bigint DEFAULT NULL,
  [status] varchar(20) DEFAULT NULL,
  PRIMARY KEY ([id])
)  ;

 

DROP TABLE IF EXISTS [outbox];

CREATE TABLE outbox (
  [id] bigint NOT NULL IDENTITY,
  [wa_mode] int DEFAULT NULL,
  [wa_no] varchar(200) NOT NULL,
  [wa_text] varchar(2000) NOT NULL,
  [wa_media] varchar(500) DEFAULT NULL,
  [wa_file] varchar(500) DEFAULT NULL,
  [wa_time] datetime2(0) NOT NULL DEFAULT GETDATE(),
  PRIMARY KEY ([id])
)  ;

 

DROP TABLE IF EXISTS [sent];

CREATE TABLE sent (
  [id] bigint NOT NULL,
  [wa_mode] int DEFAULT NULL,
  [wa_no] varchar(200) NOT NULL,
  [wa_text] varchar(2000) NOT NULL,
  [wa_media] varchar(500) DEFAULT NULL,
  [wa_file] varchar(500) DEFAULT NULL,
  [wa_time] datetime2(0) NOT NULL DEFAULT GETDATE(),
  [status] varchar(5) DEFAULT NULL,
  PRIMARY KEY ([id],[wa_time])
)  ;

 

DROP TABLE IF EXISTS [tesbot];

CREATE TABLE tesbot (
  [kode] varchar(10) DEFAULT NULL,
  [nama] varchar(50) DEFAULT NULL
) ;

 

DROP TABLE IF EXISTS [tmp];

CREATE TABLE tmp (
  [tmp_cd] varchar(50) NOT NULL,
  [tmp_val] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([tmp_cd])
)  ;

 

DROP TABLE IF EXISTS [web_user];

CREATE TABLE web_user (
  [id] bigint NOT NULL IDENTITY,
  [wa_user] varchar(100) NOT NULL,
  [wa_no] varchar(30) NOT NULL,
  [email] varchar(100) NOT NULL,
  [status] varchar(1) DEFAULT 'Y',
  [password] varchar(20) DEFAULT NULL,
  [create_dt] datetime2(0) NOT NULL DEFAULT GETDATE(),
  [last_login] datetime2(0) DEFAULT NULL,
  [qr] varchar(500) DEFAULT NULL,
  [bot_mode] varchar(1) DEFAULT NULL,
  [bot_url] varchar(500) DEFAULT NULL,
  [disable_read] varchar(1) DEFAULT 'N',
  PRIMARY KEY ([id])
)  ;