use rmsb2
GO 

CREATE OR ALTER  PROCEDURE AddPlane @name varchar(100), @airPlaneCoordinates varchar(100), @airPlaneRoute varchar(100)
--- This procedure add entry to airports table, to execute this properly You need to put parameters in order---
--- @name='planeName', , @airPlaneCoordinates='coord1 coord1',---
--- @airPlaneRoute='(coord1 coord2, coord3 coord4, ....., coordn, cooordn+1)' ---
AS BEGIN
BEGIN TRY  
    insert into [dbo].[airplanes] ([name], [Localization], [route]) 
	Values (
		 @name
		,[dbo].[CreatePointfrom1Coordinate](@airPlaneCoordinates)
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