select distinct
    {{ dbt_utils.surrogate_key(['agency_name', 'agancy']) }} as agency_dim_id,
    complaint_type,
    descriptor
    from 
    ( select distinct agency_name, agency 
      from `bigquery-public-data.new_york.311_service_requests`
      Where complaint_type = 'Rodent'