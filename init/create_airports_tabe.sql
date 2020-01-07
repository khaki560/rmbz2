/****** Create Airports table, fill with default data from osm-world-airports table, add spatial indexes******/
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'rmsb2')
	create database rmsb2 

use rmsb2

DROP TABLE IF EXISTS dbo.airports 

create Table airports (
	Id int identity(1,1) 
	,[Name] varchar(500) NOT NULL
	,country varchar(500) NOT NULL
	,Localization geometry NOT NULL
	,area  geometry NULL
	,CONSTRAINT airport_primary_id PRIMARY KEY (id)
)

CREATE SPATIAL INDEX airport_loc_index ON airports(Localization)
USING GEOMETRY_GRID
WITH (BOUNDING_BOX = (-180, -90, 180, 90))  -- for WGS84

CREATE SPATIAL INDEX airport_area_index ON airports(area)
USING GEOMETRY_GRID
WITH (BOUNDING_BOX = (-180, -90, 180, 90))  -- for WGS84
 
insert into airports ([Name], country, Localization) 
select  o.Name_en
	   ,o.[Country]
	   ,[dbo].[CreatePointfrom1Coordinate](o.[Geo_Point])
from [rmsb2].[dbo].[osm-world-airports] as o
where Name_en is  not NULL and [Country] is not NULL
