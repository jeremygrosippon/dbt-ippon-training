SELECT 
    restaurants.identifier
    , restaurants.name
    , restaurants.address
    , coalesce(sum(orders.amount), 0) as turnover
FROM 
    {{ ref('base_restaurants') }} as restaurants
left join 
    {{ ref('base_orders') }} as orders
    ON restaurants.identifier = orders.restaurant_identifier

GROUP BY 1, 2, 3
ORDER BY 
    turnover desc