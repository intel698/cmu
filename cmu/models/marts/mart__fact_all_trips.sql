select * from(
select 'bike' as type, started_at_ts, ended_at_ts, duration_min, duration_sec
from {{ref("mart__fact_all_bike_trips")}}
union
select 'taxi', tpep_pickup_datetime, tpep_pickup_datetime,  duration_min, duration_sec
from {{ref("mart__fact_all_taxi_trips")}})