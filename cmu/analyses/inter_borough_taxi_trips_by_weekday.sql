{# by weekday, count of total trips, trips starting and ending in a different borough, and
percentage w/ different start/end #}

select weekday, trips_w_diff, total_trips, (trips_w_diff/total_trips) from(
select aa.weekday, trips_w_diff, total_trips from
(select weekday(tpep_pickup_datetime) as weekday, count(*) as trips_w_diff
from {{ref("mart__fact_all_taxi_trips")}}  as a 
where a.dolocationId != a.pulocationId
group by weekday) as aa,
(select weekday(tpep_pickup_datetime) as weekday, count(*) as total_trips
from {{ref("mart__fact_all_taxi_trips")}}  as a 
where 1=1
group by weekday) as bb
where aa.weekday = bb.weekday
)