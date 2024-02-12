with
    agencias as (
        select *
        from {{ ref('dim_agencias') }}
    )

    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , colaboradores as (
        select *
        from {{ ref('dim_colaboradores') }}
    )

    , contas as (
        select *
        from {{ ref('dim_contas') }}
    )

    , datas as (
        select *
        from {{ ref('dim_datas') }}
    )

    , propostas as (
        select *
        from {{ ref('dim_propostas') }}
    )

    , transacoes as (
        select *
        from {{ ref('stg_erp_transacoes') }}
    )
    
    , joined_tabelas as (
        select 
            sk_transacao_conta
            , cod_transacao
            , transacoes.cod_conta
            , contas.cod_cliente
            , contas.cod_agencia
            , contas.cod_colaborador
            , propostas.cod_proposta

            , data_transacao
            , data_abertura_conta
            , data_ultimo_lancamento_conta
            , data_abertura_agencia
            , data_nascimento_colaborador
            , data_entrada_proposta
            , data_dia
            , nome_do_dia
            , abrev_do_mes
            , ano

            , valor_transacao
            , saldo_total_conta
            , saldo_disponivel_conta
            , taxa_juros_mensal_proposta
            , valor_proposta
            , valor_financiamento_proposta
            , valor_entrada_proposta
            , valor_prestacao_proposta
            , quantidade_parcelas_proposta
            , carencia_proposta
            , idade_cliente
            , faixa_etaria_cliente
            , tempo_conta
            , tempo_agencia

            , nome_transacao
            , case 
                when nome_transacao like '%TED%' then 'TED'
                when nome_transacao like '%DOC%' then 'DOC'
                when nome_transacao like '%Pix - Recebido%' then 'PIX'
                when nome_transacao like '%Pix - Realizado%' then 'PIX'
                when nome_transacao like '%Pix Saque%' then 'PIX'
                when nome_transacao like '%Transferência entre CC - Débito%' then 'Transferência CC - Débito'
                when nome_transacao like '%Transferência entre CC - Crédito%' then 'Transferência CC - Crédito'
                when nome_transacao like '%Pagamento de boleto%' then 'Pagamento boleto'
                when nome_transacao like '%Depósito em espécie%' then 'Pagamento espécie'
                when nome_transacao like '%Estorno de Debito%' then 'Estorno débito'
                when nome_transacao like '%Compra Crédito%' then 'Compra Crédito'
                when nome_transacao like '%Compra Débito%' then 'Compra Débito'
                else 'saque' end as nome_transacao_geral

            , nome_cliente
            , cidade_agencia
            , uf_agencia
            , tipo_agencia
            , nome_colaborador
            , status_proposta

        from transacoes
        left join contas on
            transacoes.cod_conta = contas.cod_conta
        left join datas on
            transacoes.data_transacao = datas.data_dia
        left join clientes on
            contas.cod_cliente = clientes.cod_cliente
        left join agencias on
            contas.cod_agencia = agencias.cod_agencia
        left join colaboradores on
            contas.cod_colaborador = colaboradores.cod_colaborador
        left join propostas on
            contas.cod_cliente = propostas.cod_cliente
    )

select *
from joined_tabelas