with source as (
    select * from {{ source('main','fhv_tripdata')}}
),

renamed as (
    select
        dispatching_base_num,
        pickup_datetime::date as pickup_datetime,
        dropOff_datetime::date as dropOff_datetime,
        PUlocationID::int as pickup_location_id,
        DOlocationID::int as dropoff_location_id,
        affiliated_base_number as affiliated_base_number,
        filename
    from source

)

select * from renamed
where dropOff_datetime < '2022-12-31'
