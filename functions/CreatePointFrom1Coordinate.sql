USE [rmsb2]
GO

CREATE OR ALTER FUNCTION CreatePointfrom1Coordinate (@coordinate VARCHAR(250))
--Return geometry::Point in WSG84 from single varchar variable in format (coordinate_1 cooridane_2)--
RETURNS geometry
AS BEGIN
	RETURN geometry::STPointFromText('POINT (' + REPLACE(@coordinate, ',' , ' ') + ')', 4326)
END