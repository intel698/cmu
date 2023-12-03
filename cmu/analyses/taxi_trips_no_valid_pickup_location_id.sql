--anti-join

select a.* 
from {{ref('mart__fact_all_taxi_trips')}} as a 
left join {{ref('mart__dim_locations')}} as b
on a.DOlocationID = b.locationid where b.locationid is null