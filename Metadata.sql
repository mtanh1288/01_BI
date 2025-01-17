﻿CREATE DATABASE Metadata_Group01
GO
USE Metadata_Group01
GO

-- Tạo metadata
CREATE TABLE DATA_FLOW (
	ID int not null identity(1, 1),
	TABLE_NAME nvarchar(50) null,
	CET datetime null,
	LSET datetime null
)
GO

-- Tạo trigger
CREATE TRIGGER insert_into_dataflow ON DATA_FLOW AFTER INSERT AS
BEGIN
	UPDATE DATA_FLOW
	SET LSET = GETDATE(), CET = GETDATE()
	WHERE ID IN (SELECT DISTINCT ID FROM inserted)
END
GO

-- Thêm data
TRUNCATE TABLE DATA_FLOW

INSERT INTO DATA_FLOW (TABLE_NAME, CET, LSET) VALUES ('STATE_AQI', NULL, NULL);
INSERT INTO DATA_FLOW (TABLE_NAME, CET, LSET) VALUES ('USCOUNTIES', NULL, NULL);
GO

SELECT* FROM DATA_FLOW