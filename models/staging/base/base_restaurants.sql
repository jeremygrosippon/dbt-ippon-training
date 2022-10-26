{{ config(materialized='ephemeral') }}

SELECT 
    identifier, 
    name, 
    address, 
    nb_emplyees, 
    open_on_sunday
FROM {{ source('public', 'restaurants') }}
qualify row_number() over (partition by identifier order by identifier) = 1