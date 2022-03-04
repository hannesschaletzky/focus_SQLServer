CREATE OR ALTER PROCEDURE createTable @table nvarchar(30)
AS

DECLARE @tSQL nvarchar(max);

-- DROP
SET @tSQL = N'DROP TABLE IF EXISTS ' + @table;
-- PRINT(@tSQL);
EXEC(@tSQL);

-- CREATE
SET @tSQL = N'
    CREATE TABLE ' + @table + ' (
        id int PRIMARY KEY IDENTITY(1, 1),
        created_at datetime DEFAULT GETDATE(),
        color varchar(20),
        rounds int DEFAULT (0),
        name varchar(20) DEFAULT '''',
        status varchar(50) DEFAULT ''init''
    )
';
-- PRINT(@tSQL);
EXEC(@tSQL);

-- SHOW TABLE DEFINITION
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_name in (@table);

--SHOW SAMPLE DATA
SET @tSQL = N'SELECT * FROM  ' + @table + ';';
-- PRINT(@tSQL);
EXEC(@tSQL);
