SELECT 
    identifier
    , name
    , PRODUCTION_COST
    , SELLING_PRICE
    , (SELLING_PRICE - PRODUCTION_COST) as PROFIT
    , TYPE
FROM {{ ref('base_dishes') }}