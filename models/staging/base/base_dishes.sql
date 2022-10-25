{{ config(materialized='ephemeral') }}

SELECT 
    identifier
    , name
    , PRODUCTION_COST
    , SELLING_PRICE
    , (SELLING_PRICE - PRODUCTION_COST) as PROFIT
    , TYPE
FROM {{ source('source', 'dishes') }}
qualify row_number() over (partition by identifier order by identifier) = 1