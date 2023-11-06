with source as (
    select * from {{ source('main','yellow_tripdata')}}
), renamed as (
    select 
        VendorID::int as VendorID,
        PUlocationID::int as pickup_location_id,
        DOlocationID::int as dropoff_location_id,
        RatecodeID::int as rate_code_id,
        passenger_count::int as passenger_count,
        trip_distance::double as trip_distance,
        fare_amount::double as fare_amount,
        extra::double as extra,
        mta_tax::double as mta_tax,
        tip_amount::double as tip_amount,
        tolls_amount::double as tolls_amount,
        improvement_surcharge::double as improvement_surcharge,
        total_amount::double as total_amount,
        payment_type::int as payment_type,
        congestion_surcharge::double as congestion_surcharge,
        tpep_pickup_datetime::date as pickup_datetime,
        tpep_dropoff_datetime::date as dropOff_datetime,
        {{ to_bool('store_and_fwd_flag') }} as store_flag,
        filename
    from source
)

select * from renamed
where dropOff_datetime < '2022-12-31'
and trip_distance > 0


