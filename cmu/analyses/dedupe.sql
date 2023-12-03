{# -- Deduplication
-- Use Window functions with QUALIFY and ROW_NUMBER to remove
-- duplicate rows. Prefer rows with a later time stamp #}

select *
--ROW_NUMBER() over (partition by insert_timestamp, event_id, event_type, user_id, event_timestamp order by event_timestamp) as 
from {{ref('events')}}
qualify ROW_NUMBER() over (partition by insert_timestamp, event_id, event_type, user_id, event_timestamp order by event_timestamp) = 1

