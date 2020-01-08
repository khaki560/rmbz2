use rmsb2
GO 

CREATE PROCEDURE PrintAirportArea  @airportID int
--- print coordinates of airport of specific ID in human readable way---
AS BEGIN
	SELECT [name], area.STArea() FROM [dbo].[airports] WHERE Id = @airportID
END