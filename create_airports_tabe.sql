/****** Script for SelectTopNRows command from SSMS  ******/
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'rmsb2')
	create database rmsb2 

use rmsb2

DROP TABLE IF EXISTS airports 

create Table airports (
	Id int identity(1,1) 
	,[Name] varchar(500) NOT NULL
	,country varchar(500) NOT NULL
	,Localization geometry NOT NULL
	,area  geometry NULL
	,CONSTRAINT airport_primary_id PRIMARY KEY (id)
)
 
insert into airports ([Name], country, Localization) 
select  o.[Name_en ]
	   ,o.[Country]
	   ,geometry::STPointFromText('POINT (' + REPLACE(o.[Geo_Point], ',' , ' ') + ')', 0)  -- coordinates system = WGS 84
from [rmsb2].[dbo].[osm-world-airports] as o
where Name_en is  not NULL and country is not NULL

select * from airports