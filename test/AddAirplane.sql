use rmsb2
GO 

--- samolot w lodzi ----
exec [dbo].[AddPlane] @airplaneCoordinates='51.3840722 21.2074830', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

--- samolot w radomiu ----
exec [dbo].[AddPlane] @airplaneCoordinates='51.7197 19.3906', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

--- samolot pomiedzy ----
exec [dbo].[AddPlane] @airplaneCoordinates='51.5788 20.1627', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

select * from airplanes

