use rmsb2
GO 

exec [dbo].[AddAirport] @airPortName='Radom airport', @countryName='Poland', @airPlaneCoordinates='51.3879 21.2148', @airPlaneArea='(51.3961 21.1976, 51.3926 21.2364, 51.3806 21.2306, 51.3809 21.1888, 51.3961 21.1976)'

select * from airports where name = 'Radom airport'

