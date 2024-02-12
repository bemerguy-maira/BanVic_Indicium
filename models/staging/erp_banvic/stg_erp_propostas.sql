with
    fonte_propostas as (
        select 
            cast(cod_proposta as int) as cod_proposta
            , cast(cod_cliente as int) as cod_cliente
            , cast(cod_colaborador as int) as cod_colaborador
            , cast(data_entrada_proposta as date) as data_entrada_proposta
            , cast(taxa_juros_mensal as numeric) as taxa_juros_mensal_proposta
            , cast(valor_proposta as numeric) as valor_proposta
            , cast(valor_financiamento as numeric) as valor_financiamento_proposta
            , cast(valor_entrada as numeric) as valor_entrada_proposta
            , cast(valor_prestacao as numeric) as valor_prestacao_proposta
            , cast(quantidade_parcelas as int) as quantidade_parcelas_proposta
            , cast(carencia as int) as carencia_proposta
            , cast(status_proposta as string) as status_proposta

        from {{ source( 'erp_ban_vic', 'propostas_credito') }}
    )

select *
from fonte_propostas