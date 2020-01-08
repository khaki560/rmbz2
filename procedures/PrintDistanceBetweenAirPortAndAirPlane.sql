use rmsb2
GO 

CREATE PROCEDURE PrintDistanceBetweenAirPortAndAirPlane  @airportID int, @airPlaneId int
--- print distance beetwen single airplane and airport---
AS BEGIN
	    declare @localization1 geometry = (SELECT [Localization] FROM [dbo].[airplanes] WHERE [Id] = @airPlaneId)
		declare @localization2 geometry = (SELECT [Localization] FROM [dbo].[airports]  WHERE [Id] = @airportID)
		SELECT @localization1.STDistance(@localization2)
END