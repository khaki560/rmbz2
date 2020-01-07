use rmsb2
GO 

CREATE PROCEDURE AddAirport @airPortName varchar(100), @countryName varchar(100), @airPlaneCoordinates varchar(100), @airPlaneArea varchar(100)
--- This procedure add entry to airports table, to execute this properly You need to put parameters in order---
--- @airPortName='portName', @countryName='contryName', @airPlaneCoordinates='coord1 coord1',---
--- @airPlaneArea='(coord1 coord2, coord3 coord4, ....., coordn, cooordn+1)' first and last coordinates point should be the same---
AS BEGIN
BEGIN TRY  
    insert into [dbo].[airports] ([Name], country, Localization, Area) 
	Values (
		 @airPortName
		,@countryName 
		,[dbo].[CreatePointfrom1Coordinate](@airPlaneCoordinates)
		,[dbo].[CreateGeometry](@airPlaneArea)
	)
END TRY  
BEGIN CATCH 
if ERROR_NUMBER() = 6522 --System.FormatException
BEGIN
	PRINT 'Incorect coordinates data'
END
END CATCH 
END