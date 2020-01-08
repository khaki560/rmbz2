use rmsb2
GO 

exec [dbo].[AddPlane] @airplaneCoordinates='51.3879 21.2148', @airplaneRoute='51.3961 21.1976, 51.3926 21.2364'

select * from airplanes

