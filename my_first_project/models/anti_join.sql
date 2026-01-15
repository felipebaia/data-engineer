{{ config(materialized='table') }}

with clientes as (
    select * from {{ref('clients')}}
),
pedidos as (
    select * from {{ref('pedidos')}}
)
select
    c.*
from
    clients c
LEFT JOIN
    pedidos p on c.id = p.cliente_id
where
    p.valor is null