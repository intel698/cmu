select borough, count(*) as num_trips
from {{ref("mart__fact_all_taxi_trips")}} taxi join {{ref("mart__dim_locations")}} dim on taxi.PUlocationID = dim.locationid
group by borough