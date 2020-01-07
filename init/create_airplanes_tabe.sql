/****** Create airplanes table, add spatial indexes******/
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'rmsb2')
	create database rmsb2 

use rmsb2

DROP TABLE IF EXISTS airplanes 

create Table airplanes  (
	Id int identity(1,1) 
	,Localization geometry NOT NULL
	,route  geometry NOT NULL
	,CONSTRAINT airplane_primary_id PRIMARY KEY (id)
)

CREATE SPATIAL INDEX airplanes_loc_index ON airplanes(Localization)
USING GEOMETRY_GRID
WITH (BOUNDING_BOX = (-180, -90, 180, 90))  -- for WGS84