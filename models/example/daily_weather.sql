WITH daily_weather AS (

    SELECT  
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    FROM {{ source('demo', 'weather') }}

),

daily_weather_agg as (
    select 
    daily_weather,
    weather,
    round(avg(temp), 2)as avg_temp,
    round(avg(pressure), 2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds), 2) as avg_clouds
    -- row_number() over(partition by daily_weather order by count(weather) desc) as row_numbers 

    from daily_weather  
    group by daily_weather, weather 
)

SELECT * FROM daily_weather_agg
