SELECT 
    d.identifier                       as dishe_id
    , d.name                             as dishe_name
    , date_trunc('HOUR', o.created_at) as ordered_at
    , count(*)                         as nb_orders
    , sum(d.selling_price)             as turnover
    , sum(d.profit)                    as profit
FROM 
    {{ ref('base_orders') }} as o
left join 
    {{ ref('base_dishes') }} as d
    on array_contains(d.identifier, o.dishes_ids)
group by 1, 2, 3
order by 1, 2, 3