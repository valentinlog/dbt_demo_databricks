{{ config(materialized='table') }}

with source as (
    select * from {{ ref('bronze_customers') }}
),

renamed as (
    select
        CUSTOMERID       as customer_id,
        NAME             as name,
        PHONE            as phone,
        EMAIL            as email,
        ADDRESS          as address,
        REGION           as region,
        POSTALZIP        as postal_zip,
        COUNTRY          as country,
        TO_TIMESTAMP (CREATEDAT)  as created_at,
        TO_TIMESTAMP (UPDATEDAT)  as updated_at
    from source
)

select * from renamed
