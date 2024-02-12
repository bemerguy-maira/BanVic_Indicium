with
    fonte_clientes as (
        select 
            cod_cliente
            , primeiro_nome
            , sobrenome
            , tipo_cliente
            , data_inclusao
            , data_nascimento
            , endereco
        from {{ ref('stg_erp_clientes') }}
    )

select *
from fonte_clientes