SELECT restaurants.name, ROW_NUMBER() OVER (ORDER BY restaurant_revenue desc) rank
FROM {{ ref('sum_revenue_restaurants') }} as sum_revenue_restaurants 
    left join {{ source('public', 'restaurants') }} as restaurants
        on sum_revenue_restaurants.RESTAURANT_IDENTIFIER = restaurants.identifier
