{# bike_trips_and_duration_by_weekday.sql - count & total time of
bikes trips by weekday #}

select 
    weekday(started_at_ts) as weekday,
    count(*) as total_trips,
    sum(duration_sec) as total_time_inseconds
from {{ref('mart__fact_all_bike_trips')}}
where 1=1
group by all
