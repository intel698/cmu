{% macro to_bool(column_name) %}
    REPLACE(REPLACE({{ column_name }}, 'N', '0'),'Y','1')::boolean
{% endmacro %}