with
    fonte_contas as (
        select 
            cod_conta
            , cod_cliente
            , cod_agencia
            , cod_colaborador
            , tipo_conta
            , data_abertura_conta
            , date_diff(current_date(), data_abertura_conta, year) as tempo_conta
            , saldo_total_conta
            , saldo_disponivel_conta
            , data_ultimo_lancamento_conta
           -- , date_diff(current_date(), data_ultimo_lancamento_conta, day) as tempo_conta_ociosa
        from {{ ref('stg_erp_contas') }}
    )

select *
from fonte_contas