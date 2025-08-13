{{
    config(
        materialized='table'
    )
}}

with
    int_product as (
        select *
        from {{ ref('int_produtos') }}
    )
select 
    * 
from int_product
