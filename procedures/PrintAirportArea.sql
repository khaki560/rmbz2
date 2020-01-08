use rmsb2
GO 

CREATE OR ALTER PROCEDURE PrintAirportPerimeter  @airportName varchar(100)
--- print perimeter of airport of specific Name in human readable way in kilometers---
AS BEGIN
	declare @geometry_area geometry = (select area FROM [dbo].[airports] WHERE [name] = @airportName)
	declare @geography_area geography = [dbo].[ConvertToGeography](@geometry_area, 4326)

	SELECT @geography_area.STLength() / 1000

END