{{ config(materialized='table') }}

with source as (
    select * from {{ ref('bronze_products') }}
),

renamed as (
    select
        PRODUCTID       as product_id,
        PRODUCT            as name,
        DEPARTMENT        as category,
        PRICE           as price,
        TO_TIMESTAMP(CREATEDAT)  as created_at,
        TO_TIMESTAMP(UPDATEDAT)  as updated_at
    from source
)

select * from renamed
