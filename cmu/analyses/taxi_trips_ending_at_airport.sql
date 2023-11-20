{# taxi_trips_ending_at_airport.sql - total number of trips ending in
service_zones 'Airports' or 'EWR' #}

select service_zone, count(*)
from mart__fact_all_taxi_trips as a, mart__dim_locations as b
where 1=1
and a.dolocationid = b.locationid
and b.service_zone in ('Airports', 'EWR')
group by service_zone