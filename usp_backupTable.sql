-- LOGIC: 
-- DROP TABLE IF EXISTS backup_dev_games;
-- SELECT *
-- INTO backup_dev_games 
-- FROM dev_games

CREATE OR ALTER PROCEDURE backupTable @table nvarchar(30)
AS

DECLARE @tSQL nvarchar(max);

-- DROP
SET @tSQL = N'DROP TABLE IF EXISTS backup_' + @table;
-- PRINT(@tSQL);
EXEC(@tSQL);

-- CREATE
SET @tSQL = N'
    SELECT * INTO backup_' + @table + ' FROM '  + @table;
-- PRINT(@tSQL);
EXEC(@tSQL);

--SHOW ROW COUNT
SET @tSQL = N'SELECT COUNT(*) as ''count: ' + @table + ''' FROM  ' + @table;
-- PRINT(@tSQL);
EXEC(@tSQL);
