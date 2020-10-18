/* Replace "REPLACEME" and "OLDDB" with relative DB changes */

DROP INDEX SEARCH_UPLOAD_FILE ON REPLACEME.upload_file;

CREATE TABLE REPLACEME.strapi_administrator (
	id int(11) auto_increment NOT NULL,
	username varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	email varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	password varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	resetPasswordToken varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL NULL,
	blocked tinyint(1) DEFAULT NULL NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci
COMMENT='';
CREATE FULLTEXT INDEX SEARCH_STRAPI_ADMINISTRATOR ON REPLACEME.strapi_administrator (username DESC,resetPasswordToken DESC);

INSERT into REPLACEME.strapi_administrator select * from OLDDB.strapi_administrator;

