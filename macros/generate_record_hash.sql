{% macro generate_record_hash(columns) %}
    SHA2(
        {%- for col in columns -%}
            coalesce({{ col }}, '')
            {%- if not loop.last -%} || '|' || {%- endif -%}
        {%- endfor -%},
        256
    )
{% endmacro %}
-- This macro generates a SHA2 hash of the specified columns, concatenated with '|'.