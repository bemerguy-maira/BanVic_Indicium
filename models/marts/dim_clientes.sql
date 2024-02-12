with
    fonte_clientes as (
        select 
            cod_cliente
            , nome_cliente
           -- , tipo_cliente
            , data_inclusao_cliente
            , data_nascimento_cliente
            , date_diff(current_date(), data_nascimento_cliente, year) as idade_cliente
            , endereco_cliente
        from {{ ref('stg_erp_clientes') }}
    )
    , faixa_etaria as (
        select 
            *
            , case 
                when idade_cliente <= 18 then '0-18 anos'
                when idade_cliente > 18 and idade_cliente <= 25 then '19-25 anos'
                when idade_cliente > 25 and idade_cliente <= 35 then '26-35 anos'
                when idade_cliente > 35 and idade_cliente <= 40 then '36-40 anos'
                when idade_cliente > 40 and idade_cliente <= 59 then '40-59 anos'
                else 'maior de 60 anos'
            end as faixa_etaria_cliente
        from fonte_clientes
    )
select *
from faixa_etaria