/****** Create Airports table, fill with default data from osm-world-airports table, add spatial indexes******/
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'rmsb2')
	create database rmsb2 

ALTER DATABASE rmsb2 SET COMPATIBILITY_LEVEL = 140

use rmsb2


--- Split geo_point data into two collumns ---
DROP TABLE IF EXISTS a
create table a(
	geo varchar(MAX) ,
	geo_1 varchar(MAX), 
	geo_2 varchar(MAX)
)

insert into a (geo, geo_1, geo_2)
select [Geo_Point],
    case when CHARINDEX(',',[Geo_Point])>0 
         then SUBSTRING([Geo_Point],1,CHARINDEX(',',[Geo_Point])-1) 
         else [Geo_Point] end firstGeo, 
    CASE WHEN CHARINDEX(',',[Geo_Point])>0 
         THEN SUBSTRING([Geo_Point],CHARINDEX(',',[Geo_Point])+1,len([Geo_Point]))  
         ELSE NULL END as lastGeo
from [rmsb2].[dbo].[osm-world-airports]



--- Create airports table ----
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
select  [osm-world-airports].Name_en
	   ,[osm-world-airports].[Country]
	   ,[dbo].[CreatePointfrom2Coordinate](a.geo_2, a.geo_1)
from [rmsb2].[dbo].[osm-world-airports]
INNER JOIN a ON a.geo = [osm-world-airports].[Geo_Point]
where Name_en is  not NULL and [Country] is not NULL
