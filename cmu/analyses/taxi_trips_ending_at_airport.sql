select service_zone, count(*)
from mart__fact_all_taxi_trips as a, mart__dim_locations as b
where a.dolocationid = b.locationid
and b.service_zone in ('Airports', 'EWR')
group by service_zone