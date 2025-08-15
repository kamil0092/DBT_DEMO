-- macros/get_season.sql
{% macro get_season(ts_column) %}
    CASE 
        WHEN MONTH({{ ts_column }}) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH({{ ts_column }}) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH({{ ts_column }}) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END
{% endmacro %}

{% macro day_type(x) %}
    CASE 
        WHEN DAYNAME(TO_TIMESTAMP({{ x }})) IN ('Sat', 'Sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END
{% endmacro %}
