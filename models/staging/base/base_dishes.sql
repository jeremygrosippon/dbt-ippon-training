SELECT 
    identifier
    , name
    , PRODUCTION_COST
    , SELLING_PRICE
    , TYPE
FROM {{ mockable_source('source', 'dishes', 'sample__dishes') }}
qualify row_number() over (partition by identifier order by identifier) = 1