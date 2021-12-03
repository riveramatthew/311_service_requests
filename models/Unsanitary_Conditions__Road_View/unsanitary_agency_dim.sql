select distinct
    {{ dbt_utils.surrogate_key(['agency_name', 'agency']) }} as agency_dim_id,
    agency_name,
    agency   
    from 
    ( select distinct agency_name, agency   
     from `bigquery-public-data.new_york.311_service_requests`
     Where complaint_type = 'UNSANITARY CONDITION'
     OR complaint_type = 'Dirty Conditions'
     OR complaint_type = 'Dirty Condition'
    )