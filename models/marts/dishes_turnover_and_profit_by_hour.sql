{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['dishe_id','ordered_at'],
        on_schema_change='ignore'
    )
}}

SELECT 
    d.identifier                       as dishe_id
    , d.name                           as dishe_name
    , date_trunc('HOUR', o.created_at) as ordered_at
    , count(*)                         as nb_orders
    , sum(d.selling_price)             as turnover
    , sum(d.profit)                    as profit
FROM 
    {{ ref('stg_orders__dishes_flattened') }} as o
left join 
    {{ ref('stg_dishes_with_profit') }} as d
    on d.identifier = o.dish_id

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where ordered_at >= (select max(ordered_at) from {{ this }})
{% endif %}

group by 1, 2, 3
order by 1, 2, 3