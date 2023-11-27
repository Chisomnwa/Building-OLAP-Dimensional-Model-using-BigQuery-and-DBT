with source as (

    select * from {{ source('northwind', 'products') }}
)
select * from source
