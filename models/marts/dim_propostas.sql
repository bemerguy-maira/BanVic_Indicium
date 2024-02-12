with
    fonte_propostas as (
        select 
            cod_proposta
            , cod_cliente
            , cod_colaborador
            , data_entrada_proposta
            , taxa_juros_mensal
            , valor_proposta
            , valor_financiamento
            , valor_entrada
            , valor_prestacao
            , quantidade_parcelas
            , carencia
            , status_proposta
        from {{ ref('stg_erp_propostas') }}
    )

select *
from fonte_propostas