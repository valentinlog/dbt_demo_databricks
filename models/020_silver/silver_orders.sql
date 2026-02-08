{{ config(materialized='table') }}

with source as (
    select * from {{ ref('bronze_orders') }}
),

renamed as (
    select
        ORDERID                  as order_id,
        CUSTOMERID               as customer_id,
        SALESPERSON              as sales_person,
        ORDERSTATUS                   as status,
        TO_TIMESTAMP(ORDERPLACEDTIMESTAMP)   as created_at,
        TO_TIMESTAMP(UPDATEDAT)   as updated_at
    from source
)

select * from renamed
