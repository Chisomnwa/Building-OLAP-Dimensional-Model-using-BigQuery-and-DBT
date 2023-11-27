with source as (

    select * from {{ source('northwind', 'customer') }}
)
select * from source
