CREATE DATABASE Fakultet_UBP;
USE Fakultet_UBP

-- UserAccounts Table
CREATE TABLE UserAccounts (
    UserId INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50)
);

-- BackupLogs Table
CREATE TABLE BackupLogs (
    LogId INT PRIMARY KEY,
    BackupDate DATETIME,
    BackupType VARCHAR(50),
    BackupLocation VARCHAR(100),
    UserId INT,
    CONSTRAINT FK_BackupLogs_UserAccounts FOREIGN KEY (UserId) REFERENCES UserAccounts(UserId)
);

-- PerformanceIndexes Table
CREATE TABLE PerformanceIndexes (
    IndexId INT PRIMARY KEY,
    TableName VARCHAR(50),
    IndexName VARCHAR(50),
    Columns VARCHAR(100),
    UserId INT,
    CONSTRAINT FK_PerformanceIndexes_UserAccounts FOREIGN KEY (UserId) REFERENCES UserAccounts(UserId)
);

-- StoredProcedures Table
CREATE TABLE StoredProcedures (
    ProcedureId INT PRIMARY KEY,
    ProcedureName VARCHAR(50),
    ProcedureDefinition VARCHAR(MAX),
    UserId INT,
    CONSTRAINT FK_StoredProcedures_UserAccounts FOREIGN KEY (UserId) REFERENCES UserAccounts(UserId)
);

-- TriggersTable
CREATE TABLE TriggersTable (
    TriggerId INT PRIMARY KEY,
    TableName VARCHAR(50),
    TriggerName VARCHAR(50),
    TriggerDefinition VARCHAR(MAX),
    UserId INT,
    CONSTRAINT FK_TriggersTable_UserAccounts FOREIGN KEY (UserId) REFERENCES UserAccounts(UserId)
);

-- Create login accounts
CREATE LOGIN User1 WITH PASSWORD = 'password1';
CREATE LOGIN User2 WITH PASSWORD = 'password2';
CREATE LOGIN User3 WITH PASSWORD = 'password3';
CREATE LOGIN User4 WITH PASSWORD = 'password4';
CREATE LOGIN User5 WITH PASSWORD = 'password5';

-- Create users
CREATE USER Zinedin FOR LOGIN User1;
CREATE USER Mirza FOR LOGIN User2;
CREATE USER Muris FOR LOGIN User3;
CREATE USER Eldad FOR LOGIN User4;
CREATE USER Elmir FOR LOGIN User5;

-- Assign different permissions to each user
GRANT SELECT ON UserAccounts TO Zinedin;
GRANT INSERT ON UserAccounts TO Mirza;
GRANT UPDATE ON UserAccounts TO Muris;
GRANT DELETE ON UserAccounts TO Eldad;
GRANT CREATE ON UserAccounts TO Elmir;

-- Simulating a database crash
ALTER DATABASE Fakultet_OBP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE Fakultet_UBP;

-- Create an index on PerformanceIndexes table
CREATE INDEX IX_PerformanceIndexes_TableName ON PerformanceIndexes (TableName);


-- Create a stored procedure
CREATE PROCEDURE YourStoredProcedureName
AS
BEGIN
    -- Add your stored procedure logic here
    SELECT * FROM StoredProcedures;
END;



-- Create a trigger on TriggersTable
CREATE TRIGGER YourTriggerName
ON TriggersTable
AFTER INSERT
AS
BEGIN
    -- Add your trigger logic here
    -- For example, update another table after an insert
    UPDATE TriggersTable SET TriggerId = 'NewValue' WHERE TriggerName> 10;
END;


