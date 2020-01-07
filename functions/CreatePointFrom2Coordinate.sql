USE [rmsb2]
GO

CREATE FUNCTION CreatePointFrom2Coordinate (@coordinate_1 VARCHAR(250), @coordinate_2 VARCHAR(250))
--Return geometry::Point from 2 varchar variables
RETURNS geometry
AS BEGIN
	RETURN geometry::STPointFromText('POINT (' + REPLACE(@coordinate_1, ',' , ' ') + ' ' + REPLACE(@coordinate_2, ',' , ' ') + ')', 0)
END