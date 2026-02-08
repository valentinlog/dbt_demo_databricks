{{ config(materialized='table') }}

select
    order_id,
    customer_id,
    status,
    created_at as order_created_at,
    updated_at as order_updated_at
from {{ ref('silver_orders') }}
