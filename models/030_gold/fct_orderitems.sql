{{ config(materialized='table') }}

select
    orderitems_id,
    order_id,
    product_id
from {{ ref('silver_orderitems') }}
