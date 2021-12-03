select distinct
    {{ dbt_utils.surrogate_key(['agency_name', 'agency']) }} as agency_dim_id,
    unique_key,
    agency_name,
    agency
    from 
    ( select distinct agency_name, agency, unique_key
      from `bigquery-public-data.new_york.311_service_requests`
      Where complaint_type = 'Rodent'
    )