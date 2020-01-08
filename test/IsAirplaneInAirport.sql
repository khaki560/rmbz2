use rmsb2
GO 

exec IsAirplaneInAirport @airportName='Radom airport', @airPlaneName='plane_radom'
exec IsAirplaneInAirport @airportName='Radom airport', @airPlaneName='plane_lodz'
exec IsAirplaneInAirport @airportName='Radom airport', @airPlaneName='plane_between'

exec IsAirplaneInAirport @airportName='Lodz airport', @airPlaneName='plane_radom'
exec IsAirplaneInAirport @airportName='Lodz airport', @airPlaneName='plane_lodz'
exec IsAirplaneInAirport @airportName='Lodz airport', @airPlaneName='plane_between'
