{{ config(materialized='ephemeral') }}

SELECT RESTAURANT_IDENTIFIER, sum(AMOUNT) as restaurant_revenue
FROM {{source('source', 'orders')}}
GROUP BY RESTAURANT_IDENTIFIER
ORDER BY restaurant_revenue desc