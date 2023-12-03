select 'Yellow' as Type, dolocationid, pulocationid, tpep_pickup_datetime as pickup_datetime, tpep_dropoff_datetime as dropoff_datetime, 
datediff('minute', tpep_pickup_datetime, tpep_dropoff_datetime) as duration_min,
datediff('second', tpep_pickup_datetime, tpep_dropoff_datetime) as duration_sec,
from {{ref('stg_yellow_tripdata')}}
union
select 'Green', dolocationid, pulocationid, lpep_pickup_datetime, lpep_dropoff_datetime, 
datediff('minute', lpep_pickup_datetime, lpep_dropoff_datetime),
datediff('second', lpep_pickup_datetime, lpep_dropoff_datetime),
from {{ref('stg_green_tripdata')}}
union
select 'FHV', dolocationid, pulocationid, pickup_datetime, dropoff_datetime, 
datediff('minute', pickup_datetime, dropoff_datetime),
datediff('second', pickup_datetime, dropoff_datetime),
from {{ref('stg_fhv_tripdata')}}
union
select 'FHVHV', dolocationid, pulocationid, pickup_datetime, dropoff_datetime, 
datediff('minute', pickup_datetime, dropoff_datetime),
datediff('second', pickup_datetime, dropoff_datetime),
from {{ref('stg_fhvhv_tripdata')}}
