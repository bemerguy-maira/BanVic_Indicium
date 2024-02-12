with
    fonte_propostas as (
        select 
            cod_proposta
            , cod_cliente
            , cod_colaborador
            , data_entrada_proposta
            , taxa_juros_mensal_proposta
            , valor_proposta
            , valor_financiamento_proposta
            , valor_entrada_proposta
            , valor_prestacao_proposta
            , quantidade_parcelas_proposta
            , carencia_proposta
            , status_proposta
        from {{ ref('stg_erp_propostas') }}
    )

select *
from fonte_propostas