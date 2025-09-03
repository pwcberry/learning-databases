-- Install AdventureWorks database and create user accounts

USE [master]
GO

RESTORE DATABASE AdventureWorks
    FROM DISK = N'/var/opt/mssql/backup/AdventureWorks2022.bak'
    WITH
        MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks_Log.ldf',
    REPLACE
GO

CREATE LOGIN aw_admin WITH PASSWORD=N'passW0rd', DEFAULT_DATABASE=AdventureWorks,
    CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

USE [AdventureWorks]
GO

CREATE USER admin FOR LOGIN aw_admin
GO

EXEC sp_addrolemember N'db_owner', N'admin'
GO

-- Install WideWorldImporters database and create user accounts

USE [master]
GO

RESTORE DATABASE WideWorldImporters
    FROM DISK = N'/var/opt/mssql/backup/WideWorldImporters-Full.bak'
    WITH
        MOVE 'WWI_Primary' TO '/var/opt/mssql/data/WideWorldImporters.mdf',
        MOVE 'WWI_UserData' TO '/var/opt/mssql/data/WideWorldImporters_UserData.ndf',
        MOVE 'WWI_Log' TO '/var/opt/mssql/data/WideWorldImporters.ldf',
        MOVE 'WWI_InMemory_Data_1' TO '/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',
        REPLACE
GO

CREATE LOGIN wwi_admin WITH PASSWORD=N'passW0rd', DEFAULT_DATABASE=WideWorldImporters,
    CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

USE [WideWorldImporters]
GO

CREATE USER admin FOR LOGIN wwi_admin
GO

EXEC sp_addrolemember N'db_owner', N'admin'
GO
