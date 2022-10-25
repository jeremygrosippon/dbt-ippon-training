{{ config(materialized='ephemeral') }}

SELECT RESTAURANT_IDENTIFIER, sum(TOTAL_PRICE) as restaurant_revenue
FROM {{source('public', 'commandes')}}
GROUP BY RESTAURANT_IDENTIFIER