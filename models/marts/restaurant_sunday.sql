SELECT 
    *
FROM 
    {{ ref('base_restaurants') }}
WHERE 
    open_on_sunday