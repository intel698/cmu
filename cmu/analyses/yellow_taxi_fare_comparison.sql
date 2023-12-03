{# Basic window function - #}


select zone, borough, fare_amount
        , avg(fare_amount) over (partition by zone) as zone_avg
        , avg(fare_amount) over (partition by borough) as borough_avg
        , (select avg(fare_amount) from {{ref('stg_yellow_tripdata')}} ) as total_avg
from {{ref('stg_yellow_tripdata')}} yl join {{ref("mart__dim_locations")}} dim on yl.PUlocationID = dim.locationid
order by 1,2


