USE [rmsb2]
GO

CREATE FUNCTION [dbo].[CreateLine] (@coordinates VARCHAR(MAX))
--Return geometry::Line from single varchar variable in format (coordinate_1 cooridane_2, coordinate_1 cooridane_2, ......, coordinate_n cooridane_n+1)--
RETURNS geometry
AS BEGIN
	RETURN geometry::STLineFromText('LINESTRING  (' + @coordinates + ')', 1)
END
