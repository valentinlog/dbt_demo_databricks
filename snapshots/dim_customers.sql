{% snapshot dim_customers %}

{{
    config(
        unique_key='customer_id',
        schema='gold',
        strategy='check',
        check_cols=[
            'name', 'phone', 'email', 'address', 'region', 'postal_zip', 'country'
        ]
    )
}}

select
    customer_id,
    name,
    phone,
    email,
    address,
    region,
    postal_zip,
    country,

    {{ generate_record_hash([
        'customer_id', 'name', 'phone', 'email', 'address', 'region', 'postal_zip', 'country'
    ]) }} as record_hash

from {{ ref('silver_customers') }}

{% endsnapshot %}
