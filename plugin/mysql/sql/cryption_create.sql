# sample script

CREATE FUNCTION encryptionMysql RETURNS STRING SONAME 'jimant_mysql_cryption.so';              
CREATE FUNCTION decryptionMysql RETURNS STRING SONAME 'jimant_mysql_cryption.so';      


delimiter $$
CREATE FUNCTION CUSTOM_DB.`encryptionFO4S`( data VARCHAR ( 100 ), dbName VARCHAR( 100), tableName VARCHAR(100), columnName VARCHAR(100)  ) RETURNS varchar(100) CHARSET utf8
BEGIN
   DECLARE result VARCHAR( 100);
   DECLARE ip VARCHAR(100);
   DECLARE dbUser VARCHAR(100);
   DECLARE threadID VARCHAR(100);

   SET ip =  ( SELECT substring_index (USER (), '@', -1 )  );
   SET dbUser =  ( SELECT substring_index (USER (), '@', 1) ) ;
   SET threadID =  ( SELECT CONNECTION_ID() ) ;
  SET result = encryptionMysql(ip, dbUser, threadID, data, dbName, tableName, columnName);
  RETURN result ;
END $$
delimiter ;


delimiter $$
CREATE FUNCTION CUSTOM_DB.`decryptionFO4S`( data VARCHAR ( 100 ), dbName VARCHAR( 100), tableName VARCHAR(100), columnName VARCHAR(100)  ) RETURNS varchar(100) CHARSET utf8
BEGIN
   DECLARE result VARCHAR( 100);
   DECLARE ip VARCHAR(100);
   DECLARE dbUser VARCHAR(100);
   DECLARE threadID VARCHAR(100);

   SET ip =  ( SELECT substring_index (USER (), '@', -1 )  );
   SET dbUser =  ( SELECT substring_index (USER (), '@', 1) ) ;
   SET threadID =  ( SELECT CONNECTION_ID() ) ;
   SET result = decryptionMysql(ip, dbUser, threadID, data, dbName, tableName, columnName);
  RETURN result ;
END $$
delimiter ;
