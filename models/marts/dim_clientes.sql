with
    fonte_clientes as (
        select 
            cod_cliente
            , primeiro_nome_cliente
            , sobrenome_cliente
            , tipo_cliente
            , data_inclusao_cliente
            , data_nascimento_cliente
            , endereco_cliente
        from {{ ref('stg_erp_clientes') }}
    )

select *
from fonte_clientes