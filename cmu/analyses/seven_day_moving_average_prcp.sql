{# -- Lead & Lag - Simple - Write a query to calculate the 7 day moving average precipitation for every day in
-- the weather data.

-- The 7 day window should center on the day in question (for each date, the 3 days
-- before, the date & 3 days after). #}

select date,(avg(prcp) over seven_days) as avg_rain
from {{ref("stg_central_park_weather")}}
window seven_days as (
    order by date asc
    rows between  3 preceding
    and 3 following) 