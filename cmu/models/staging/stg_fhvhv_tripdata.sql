with source as (
    select * from {{ source('main','fhvhv_tripdata')}}
),

renamed as (
    select 
        hvfhs_license_num as license_number,
        dispatching_base_num,
        originating_base_num,
        request_datetime::date as request_datetime,
        on_scene_datetime::date as on_scene_datetime,
        pickup_datetime::date as pickup_datetime,
        dropoff_datetime::date as dropOff_datetime,
        PULocationID::int as pickup_location_id,
        DOLocationID::int as dropoff_location_id,
        trip_miles::double as trip_miles,
        trip_time::double as trip_time,
        base_passenger_fare::double as base_passenger_fare,
        tolls::double as tolls,
        bcf::double as black_car_fund,
        sales_tax::double as sales_tax,
        congestion_surcharge::double as congestion_surcharge,
        airport_fee::double as airport_fee,
        tips::double as tips,
        driver_pay::double as driver_pay,
        access_a_ride_flag,
        {{ to_bool('shared_request_flag') }} as shared_request_flag,
        {{ to_bool('shared_match_flag') }} as shared_match_flag,
        {{ to_bool('wav_request_flag') }} as wheelchair_request_flag,
        {{ to_bool('wav_match_flag') }} as wheelchair_used_flag,
        filename



    from source

)

select * from renamed
where dropOff_datetime < '2022-12-31'


