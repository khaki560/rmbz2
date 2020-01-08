use rmsb2
GO 

CREATE or ALTER PROCEDURE PrintDistanceBetweenAirPortAndAirPlane  @airportName varchar(100), @airPlaneName varchar(100)
--- print distance beetwen single airplane and airport in kilometers---
AS BEGIN
	    declare @localization1 geometry = (SELECT [Localization] FROM [dbo].[airplanes] WHERE [name] = @airPlaneName)
		declare @localization2 geometry = (SELECT [Localization] FROM [dbo].[airports]  WHERE [name] = @airportName)

		declare @localization3 geography = [dbo].[ConvertToGeography](@localization1, 4326)
		declare @localization4 geography = [dbo].[ConvertToGeography](@localization2, 4326)

		SELECT @localization3.STDistance(@localization4) / 1000
END