use rmsb2
GO 

CREATE OR ALTER PROCEDURE IsAirplaneInAirport  @airportName varchar(100), @airPlaneName varchar(100)
--- print Yes if airplaine is inside airport area, No otherwise---
AS BEGIN
	    declare @localization geometry = (SELECT [Localization] FROM [dbo].[airplanes] WHERE [name] = @airPlaneName)
		declare @area geometry = (SELECT [area] FROM [dbo].[airports]  WHERE [name] = @airportName)
		IF @area.STContains(@localization) = 1 
			PRINT 'YES'
		ELSE	
			PRINT 'NO'
END
