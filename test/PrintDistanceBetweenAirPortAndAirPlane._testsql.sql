use rmsb2
GO 


exec PrintAirportLocation 168

select localization.ToString() from airports where Id = 13

exec PrintDistanceBetweenAirPortAndAirPlane 168, 13
exec PrintDistanceBetweenAirPortAndAirPlane 228, 13