USE [rmsb2]
GO

CREATE OR ALTER FUNCTION CreatePointFrom2Coordinate (@coordinate_1 VARCHAR(250), @coordinate_2 VARCHAR(250))
--Return geometry::Point in WSG84 from 2 varchar variables
RETURNS geometry
AS BEGIN
	RETURN geometry::STPointFromText('POINT (' + REPLACE(@coordinate_1, ',' , ' ') + ' ' + REPLACE(@coordinate_2, ',' , ' ') + ')', 4326)
END