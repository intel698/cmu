{# Pivot  Create a model which sums trips by borough #}


PIVOT {{ref("mart__fact_trips_by_borough")}} ON borough USING sum(num_trips)