SELECT 
    dishe_id                           as dishe_id
    , dishe_name                         as dishe_name
    , date_trunc('DAY', ordered_at)    as ordered_at
    , count(*)                         as nb_orders
    , sum(turnover)                    as turnover
    , sum(profit)                      as profit
FROM {{ ref('dishes_turnover_and_profit_by_hour') }}
group by 1, 2, 3
order by 1, 2, 3