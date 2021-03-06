@echo Starting Database Mgr...	>> CreateDB.log
setlocal

REM
REM Process command line parameter
REM
set ACCOUNT_DDL_FILE=%1
if "%1"=="" set ACCOUNT_DDL_FILE=_OnlineStoreEJB.jar_DB2EXPRESS_V82_1_Table.ddl

REM Enter a userid and its password. User must have Database Admin privileges. 
set TARGET_USERID=wasadmin
set TARGET_PASSWORD=wasadmin

REM The drive letter and colon pointing to where DB2 is installed
set DRIVE=C:

db2start

db2 -z CreateDB.log connect reset

@echo dropping STORE database (if it exists)...	>> CreateDB.log
db2 -z CreateDB.log drop database STORE

@echo Creating the STORE database. This will take some time...

@echo create new STORE database...	>> CreateDB.log
db2 -z CreateDB.log create database STORE

@echo connect to STORE...	>> CreateDB.log
db2 -z CreateDB.log connect to STORE user %TARGET_USERID% using %TARGET_PASSWORD%

@echo creating database schema for STORE...	>> CreateDB.log
db2 -tvf %ACCOUNT_DDL_FILE%

@echo done creating STORE database...	>> CreateDB.log
db2 -z CreateDB.log disconnect STORE

@echo Done. Verifying database creation....	>> CreateDB.log
db2 -z CreateDB.log connect to STORE user %TARGET_USERID% using %TARGET_PASSWORD%
db2 -z CreateDB.log list tables
db2 -z CreateDB.log disconnect STORE

@echo You should have seen the following tables:	>> CreateDB.log
@echo CUSTOMER, LINEITEM, PRODUCT, PURCHASE	>> CreateDB.log

endlocal
exit
