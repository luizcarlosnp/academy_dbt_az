{{
    config(
        materialized='table'
    )
}}

with
    raw_data as (
        select *
        from {{ source('northwind', 'products') }}
    )

    , renomeacao as (
        select
			cast(id as int) as pk_produto
           , cast(supplierid as varchar) as fk_fornecedor
           , cast(categoryid as varchar) as fk_categoria
           , cast(productname as varchar) as ds_nome_produto
           , cast(quantityperunit as varchar) as ds_quantidade_unidade
           , cast(unitprice as numeric(18,2)) as preco_por_unidade
           , cast(unitsinstock as int) as unidade_em_estoque
           , cast(unitsonorder as int) as unidades_por_pedido
           , cast(reorderlevel as int) as nivel_de_pedido
           , cast(discontinued as varchar) as eh_descontinuado 
        from raw_data
    )
    select * from renomeacao