{# -- Named Windows - 

-- Write a query to calculate the 7 day moving min, max, avg, sum for precipitation
-- and snow for every day in the weather data, defining the window only once.

-- The 7 day window should center on the day in question (for each date, the 3 days
-- before, the date & 3 days after). #}

select date, prcp, snow
    , (min(prcp) over seven_days) as min_rain
    , (max(prcp) over seven_days) as max_rain
    , (avg(prcp) over seven_days) as avg_rain
    , (min(snow) over seven_days) as min_snow
    , (max(snow) over seven_days) as max_snow
    , (avg(snow) over seven_days) as avg_snow
from {{ref("stg_central_park_weather")}}
window seven_days as (
    order by date asc
    rows between  3 preceding
    and 3 following) 