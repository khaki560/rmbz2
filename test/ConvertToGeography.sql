use rmsb2

select localization.ToString() from airports where id = 1
select dbo.ConvertToGeography(localization, 4326).ToString() from airports where id = 1	