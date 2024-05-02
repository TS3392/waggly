-- Drop and recreate 'dogs' table if it doesn't already exist

DROP TABLE IF EXISTS dbo.dogs;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
  WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'dogs')
BEGIN
  CREATE TABLE dbo.dogs (
    dog_id UNIQUEIDENTIFIER PRIMARY KEY,
    owner_name NVARCHAR(200) NOT NULL,
    owner_email NVARCHAR(200) NOT NULL,
    dog_name NVARCHAR(200) NOT NULL
  );
END;

-- Drop and recreate 'walkers' table if it doesn't already exist

DROP TABLE IF EXISTS dbo.walkers;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
  WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'walkers')
BEGIN
  CREATE TABLE dbo.walkers (
    walker_id UNIQUEIDENTIFIER PRIMARY KEY,
    walker_name NVARCHAR(200) NOT NULL,
    walker_email NVARCHAR(200) NOT NULL,
    walker_postcode NVARCHAR(200) NOT NULL
  );
END;
