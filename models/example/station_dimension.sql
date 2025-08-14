WITH BIKE AS (
    SELECT 
    distinct
    START_STATIO_ID as station_id,
    START_STATION_NAME as station_name ,
    START_LAT as station_lat,
    START_LNG as station_lng

    FROM {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    
)

select * from BIKE