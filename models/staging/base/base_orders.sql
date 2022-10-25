{{ config(materialized='ephemeral') }}


SELECT 
    identifier                  as identifier
    , restaurant_identifier     as restaurant_identifier
    , payment_method            as payment_method
    , parse_json(DISHES_IDS)    as DISHES_IDS
    , amount                    as amount
    , to_timestamp(created_at)  as created_at
FROM {{source('source', 'orders')}}
qualify row_number() over (partition by identifier order by identifier) = 1