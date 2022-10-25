SELECT 
    ROW_NUMBER() OVER (ORDER BY turnover desc) as rank
    , name
    , address
    , turnover
FROM 
    {{ ref('stg_restaurants_turnover') }} as turnover_restaurants
limit 
    {{ var('number_restaurants_in_rank') }}
