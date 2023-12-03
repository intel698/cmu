{# -- Group by and Having - #}


select zone, count(*)
from {{ref("mart__fact_all_taxi_trips")}} trips
join {{ref('mart__dim_locations') }} pl on trips.PUlocationID = pl.LocationID
group by zone
having count(*) < 100000