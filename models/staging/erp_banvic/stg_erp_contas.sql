with
    fonte_contas as (
        select 
            cast(num_conta as int) as cod_conta
            , cast(cod_cliente as int) as cod_cliente
            , cast(cod_agencia as int) as cod_agencia
            , cast(cod_colaborador as int) as cod_colaborador
            , cast(tipo_conta as string) as tipo_conta
            , cast(data_abertura as date) as data_abertura_conta
            , cast(saldo_total as numeric) as saldo_total_conta
            , cast(saldo_disponivel as numeric) as saldo_disponivel_conta
            , cast(data_ultimo_lancamento as date) as data_ultimo_lancamento_conta

        from {{ source( 'erp_ban_vic', 'contas') }}
    )

select *
from fonte_contas