SELECT [name], database_id, create_date
  FROM sys.databases
  WHERE name <> 'tempdb'
  ORDER BY create_date DESC
GO

