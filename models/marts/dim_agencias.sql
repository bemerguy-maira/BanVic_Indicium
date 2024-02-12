with
    fonte_agencias as (
        select 
            cod_agencia
            , nome_agencia
          --  , endereco_agencia
            , cidade_agencia
            , uf_agencia
            , data_abertura_agencia
            , date_diff(current_date(), data_abertura_agencia, year) as tempo_agencia
            , tipo_agencia
        from {{ ref('stg_erp_agencias') }}
    )

select *
from fonte_agencias

