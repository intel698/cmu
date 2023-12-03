select  pl.borough
    , dl.borough, pl.zone
    , dl.zone
    , AVG(datediff('minute', pickup_datetime, dropoff_datetime)) as AverageTime
from {{ref("mart__fact_all_taxi_trips")}} trips
join {{ref('mart__dim_locations') }} pl on trips.PUlocationID = pl.LocationID
join {{ref('mart__dim_locations') }} dl on trips.DOlocationID = dl.LocationID
group by all