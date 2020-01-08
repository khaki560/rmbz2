use rmsb2
GO 

CREATE PROCEDURE PrintAirportLocation  @airportID int
--- print coordinates of airport of specific ID in human readable way---
AS BEGIN
	SELECT [name], Localization.ToString() FROM [dbo].[airports] WHERE Id = @airportID
END