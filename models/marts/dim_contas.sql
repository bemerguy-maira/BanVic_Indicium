with
    fonte_contas as (
        select 
            cod_conta
            , cod_cliente
            , cod_agencia
            , cod_colaborador
            , tipo_conta
            , data_abertura
            , saldo_total
            , saldo_disponivel
            , data_ultimo_lancamento
        from {{ ref('stg_erp_contas') }}
    )

select *
from fonte_contas