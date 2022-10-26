SELECT 
    d.identifier                       as dishe_id
    , d.name                             as dishe_name
    , date_trunc('HOUR', o.created_at) as ordered_at
    , count(*)                         as nb_orders
    , sum(d.selling_price)             as turnover
    , sum(d.profit)                    as profit
FROM 
    {{ ref('stg_orders__dishes_flattened') }} as o
left join 
    {{ ref('stg_dishes_with_profit') }} as d
    on array_contains(d.identifier, o.dishes_ids)
group by 1, 2, 3
order by 1, 2, 3