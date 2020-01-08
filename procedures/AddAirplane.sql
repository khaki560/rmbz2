use rmsb2
GO 

CREATE PROCEDURE AddPlane @airPlaneCoordinates varchar(100), @airPlaneRoute varchar(100)
--- This procedure add entry to airports table, to execute this properly You need to put parameters in order---
--- @airPortName='portName', @countryName='contryName', @airPlaneCoordinates='coord1 coord1',---
--- @airPlaneArea='(coord1 coord2, coord3 coord4, ....., coordn, cooordn+1)' first and last coordinates point should be the same---
AS BEGIN
BEGIN TRY  
    insert into [dbo].[airplanes] ([Localization], [route]) 
	Values (
		 [dbo].[CreatePointfrom1Coordinate](@airPlaneCoordinates)
		,[dbo].[CreateLine](@airPlaneRoute)
	)
END TRY  
BEGIN CATCH 
if ERROR_NUMBER() = 6522 --System.FormatException
BEGIN
	PRINT 'Incorect coordinates data'
END
END CATCH 
END