USE [rmsb2]
GO

CREATE FUNCTION [dbo].[CreateGeometry] (@coordinates VARCHAR(MAX))
--Return geometry::MultiPolygon from single varchar variable in format (coordinate_1 cooridane_2, coordinate_1 cooridane_2, ......, coordinate_n cooridane_n+1)--
RETURNS geometry
AS BEGIN
	RETURN geometry::STPolyFromText('POLYGON   (' + @coordinates + ')', 2)
END