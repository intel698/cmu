
{{config(error_if = '>50')}}
{{config(severity = 'warn')}}

select *
from {{ ref('stg_central_park_weather' )}}
where snow> snwd
and snwd>0