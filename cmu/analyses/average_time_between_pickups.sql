-- {# Lead & Lag - Complex

-- Find the average time between taxi pick ups per zone
-- Use lead or lag to find the next trip per zone for each record then find the time difference between the pick up time for the current record
-- and the next then use this result to calculate the average time between pick ups per zone. #}

select zone, AVG(datediff('minute', next_time, pickup_datetime)) as AverageTime 
from(
    select zone, pickup_datetime, (LAG(pickup_datetime, 1) over wd) as next_time
    from {{ref("mart__fact_all_taxi_trips")}} trip join {{ref("mart__dim_locations")}} dim on trip.pulocationid = dim.locationid
    window wd as (order by pickup_datetime)
    )
group by zone
order by 2 desc