use rmsb2
GO 

CREATE OR ALTER FUNCTION ConvertToGeography(@ob Geometry, @coordSystem int)
RETURNS geography
--- Convert ob geomtery object into Geographic object with choosen coordinate system---
AS BEGIN
return geography::STGeomFromText(@ob.ToString(), @coordSystem);
END
