with source as (
    select * from {{ source('main','central_park_weather')}}
),

renamed as (
    select
        station,
        name,
        date::date as date,
        awnd::double as avg_wind_speed,
        prcp::double as precipitation,
        snow::double as snowfall,
        snwd::double as snow_depth,
        tmax::int as temp_max,
        tmin::int as temp_min,
        filename
    from source

)

select * from renamed
where date < '2022-12-31'
order by 3 desc


