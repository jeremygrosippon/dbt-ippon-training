{% macro get_column_values(target_table, column_name) %}
    {% set query %}
        select distinct
            {{ column_name }}
        from 
            {{ target_table }}
        order by 1
    {% endset %}

    {% set results = run_query(query) %}

    {% if execute %}
        {# Return the first column #}
        {% set results_list = results.columns[0].values() %}
    {% else %}
        {% set results_list = [] %}
    {% endif %}
    {{ log("result list " ~ results_list, info = true)}}
    {{ return(results_list) }}
{% endmacro %}


{% macro get_payment_methods() %}
    {{ return(get_column_values(source('source', 'orders'), 'payment_method')) }}
{% endmacro %}