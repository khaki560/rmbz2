use rmsb2
GO 

CREATE OR ALTER PROCEDURE PrintAirportLocation  @airportName varchar(100)
--- print coordinates of airport of specific ID in human readable way---
AS BEGIN
	SELECT [name], Localization.STY as Lat,localization.STX as lon FROM [dbo].[airports] WHERE [name] = @airportName
END