CREATE DATABASE Stage_Group01
GO
USE Stage_Group01
GO

DROP TABLE STATE_AQI_STAGE
DROP TABLE USCOUNTIES_STAGE

-- Tạo database lưu Stage
CREATE TABLE STATE_AQI_STAGE (
	ID int not null identity(1, 1),
	state_name varchar(50) null,
	county_name varchar(50) null,
	state_code int null,
	county_code int null,
	date_recorded datetime null,
	AQI int null,
	category varchar(50) null,
	defining_parameter varchar(50) null,
	defining_site varchar(50) null,
	number_of_sites_reporting int null,
	created datetime null,
	last_updated datetime null
)
GO

CREATE TABLE USCOUNTIES_STAGE (
	ID int not null identity(1, 1),
	county nvarchar(50) null,
	county_ascii nvarchar(50) null,
	county_full nvarchar(50) null,
	county_fips nvarchar(10) null,
	state_id nvarchar(5) null,
	state_name nvarchar(50) null,
	lat nvarchar(10) null,
	lng nvarchar(15) null,
	population nvarchar(10) null
)
GO

UPDATE USCOUNTIES_STAGE  
SET county = REPLACE(county, '"', ''), county_ascii = REPLACE(county_ascii, '"', ''), county_full = REPLACE(county_full, '"', ''),
		county_fips = REPLACE(county_fips, '"', ''), state_id = REPLACE(state_id, '"', ''), state_name = REPLACE(state_name, '"', ''),
		lat = REPLACE(lat, '"', ''), lng = REPLACE(lng, '"', ''), population = REPLACE(population, '"', '')

SELECT* FROM STATE_AQI_STAGE
SELECT* FROM USCOUNTIES_STAGE
GO

SELECT COUNT(DISTINCT county) FROM USCOUNTIES_STAGE
SELECT COUNT(DISTINCT county_name) FROM STATE_AQI_STAGE
SELECT COUNT(DISTINCT county_code) FROM STATE_AQI_STAGE
GO