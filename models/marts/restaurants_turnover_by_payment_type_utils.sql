{% set payment_methods = dbt_utils.get_column_values(table=source('source', 'orders'), column='payment_method') %}

SELECT 
    r.identifier as identifier
    , r.name       as name
    , r.address    as address
    {% for payment_method in payment_methods %}
        , coalesce(sum(case when payment_method = '{{payment_method}}' then o.amount end), 0) as {{payment_method}}_amount
    {% endfor %}
FROM 
    {{ ref('base_restaurants') }} r
left join 
    {{ ref('base_orders') }} o
    on r.identifier = o.restaurant_identifier
group by 1, 2, 3