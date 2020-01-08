#RMSBZ

## Setup 

1. Create database rmsb2 
2. Import flat data from osm-world-airports.csv
3. Run all scripts from functions:
   - CreateGeometry.sql
   - CreatePointFrom1Coordinate.sql
   - CreatePointFrom2Coordinate.sql
   - CreateWay.sql
   - ConvertToGeography.sql
3. Run init/create_airports_tabe.sql
4. Run init/create_airplanes_tabe.sql
5. Run all scripts from procedures:
   - AddAirport.sql
   - AddAirplane.sql
   - IsAirplaneInAirport.sql
   - PrintAirportArea.sql
   - PrintAirportLocation.sql
   - PrintDistanceBetweenAirPortAndAirPlane.sql
6. Run scripts from tests
	- AddAirplane.sql
	- AddAirport.sql
   
   
Right now You Should have prepared database. Now You can have fun with other procedures inside tests