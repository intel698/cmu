with source as (
    -- Used to standardized member/Subscriber and casual/customer
    select REPLACE(REPLACE(member_casual, 'member', 'Subscriber'), 'casual', 'Customer') as type, * from {{ source('main','bike_data')}}
)


select 
COALESCE(start_station_id, "start station id")::int as start_station_id,
COALESCE(end_station_id, "end station id")::int as end_station_id,
COALESCE(start_station_name, "start station name") as end_station_id,
COALESCE(end_station_name, "end station name") as end_station_id,
COALESCE(started_at, starttime)::date as start_time,
COALESCE(ended_at, stoptime)::date as end_time,
COALESCE(ride_id, bikeid) as end_time,
member_casual,
tripduration,
gender,
"birth year",
COALESCE(type, usertype) as end_time,


from source
