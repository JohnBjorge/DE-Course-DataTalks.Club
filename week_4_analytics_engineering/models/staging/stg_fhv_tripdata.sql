{{ config(materialized='view') }}

select
    -- identifiers
    cast(int64_field_0 as integer) as fhv_id,
    cast(dispatching_base_num as string) as dispatching_base_num,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    cast(PUlocationID as integer) as pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    cast(SR_flag as numeric) as sr_flag,
    cast(Affiliated_base_number as string) as affiliated_base_number,
from {{ source('staging','fhv_tripdata') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
