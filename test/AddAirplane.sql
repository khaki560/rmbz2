use rmsb2
GO 


--- samolot w lodzi ----
DELETE FROM airplanes WHERE [name]='plane_radom';
exec [dbo].[AddPlane] @name='plane_radom', @airplaneCoordinates='51.3890,21.2146', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

--- samolot w radomiu ----
DELETE FROM airplanes WHERE [name]='plane_lodz';
exec [dbo].[AddPlane] @name='plane_lodz', @airplaneCoordinates='51.7197 19.3906', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

--- samolot pomiedzy ----
DELETE FROM airplanes WHERE [name]='plane_between';
exec [dbo].[AddPlane] @name='plane_between', @airplaneCoordinates='51.5788 20.1627', @airplaneRoute='51.3840722 21.2074830, 51.7197 19.3906'

select * from airplanes

