{%- set payment_methods = get_payment_methods() -%}

SELECT 
    r.identifier as identifier
    {% for payment_method in payment_methods %}
        , coalesce(sum(case when payment_method = '{{payment_method}}' then o.amount end), 0) as {{payment_method}}_amount
    {% endfor %}
FROM 
    {{ ref('base_restaurants') }} r
left join 
    {{ ref('base_orders') }} o
    on r.identifier = o.restaurant_identifier
group by r.identifier