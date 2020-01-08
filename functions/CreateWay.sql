USE [rmsb2]
GO

CREATE OR ALTER FUNCTION [dbo].[CreateLine] (@coordinates VARCHAR(MAX))
--Return geometry::Line in WSG84 from single varchar variable in format (coordinate_1 cooridane_2, coordinate_1 cooridane_2, ......, coordinate_n cooridane_n+1)--
RETURNS geometry
AS BEGIN
	RETURN geometry::STLineFromText('LINESTRING  (' + @coordinates + ')', 1)
END