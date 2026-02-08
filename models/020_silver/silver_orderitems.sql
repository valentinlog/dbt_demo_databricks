{{ config(materialized='table') }}

with source as (
    select * from {{ ref('bronze_orderitems') }}
),

renamed as (
    select
        ORDERITEMSID   as orderitems_id,
        ORDERID        as order_id,
        PRODUCTID      as product_id
    from source
)

select * from renamed
