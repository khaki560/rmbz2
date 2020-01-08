use rmsb2
GO 


exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Radom airport', @airPlaneName='plane_radom'
exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Radom airport', @airPlaneName='plane_between'
exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Radom airport', @airPlaneName='plane_lodz'


exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Lodz airport', @airPlaneName='plane_lodz'  
exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Lodz airport', @airPlaneName='plane_between'
exec PrintDistanceBetweenAirPortAndAirPlane  @airportName='Lodz airport', @airPlaneName='plane_radom'  