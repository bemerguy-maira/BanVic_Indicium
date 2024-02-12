with
    fonte_transacoes as (
        select 
            cast(cod_transacao as int) as cod_transacao
            , cast(num_conta as int) as cod_conta
            , cast(data_transacao as date) as data_transacao
            , cast(nome_transacao as string) as nome_transacao
            , cast(valor_transacao as numeric) as valor_transacao

        from {{ source( 'erp_ban_vic', 'transacoes') }}
    )
    , criar_chave as (
        select
            cast(cod_transacao as string) || '-' || cast(cod_conta as string) as sk_transacao_conta
            , *
        from fonte_transacoes
    )
select *
from criar_chave