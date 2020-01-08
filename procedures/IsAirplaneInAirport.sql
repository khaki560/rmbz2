use rmsb2
GO 

CREATE OR ALTER PROCEDURE IsAirplaneInAirport  @airportID int, @airPlaneId int
--- print Yes if airplaine is inside airport area, No otherwise---
AS BEGIN
	    declare @localization1 geometry = (SELECT [Localization] FROM [dbo].[airplanes] WHERE [Id] = @airPlaneId)
		declare @localization2 geometry = (SELECT [Localization] FROM [dbo].[airports]  WHERE [Id] = @airportID)
		IF @localization2.STContains(@localization1) = 1 
			PRINT 'YES'
		ELSE
			PRINT 'NO'
END
