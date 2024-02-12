with
    fonte_colaboradores as (
        select 
            cod_colaborador
            , primeiro_nome_colaborador
            , sobrenome_colaborador
            , data_nascimento_colaborador
            , endereco_colaborador
        from {{ ref('stg_erp_colaboradores') }}
    )
    , fonte_colaborador_agencia as (
        select
            cod_colaborador
            , cod_agencia
        from {{ ref('stg_erp_colaborador_agencia') }}
    )
    , joined_tabelas as (
        select 
            fonte_colaboradores.cod_colaborador
            , fonte_colaboradores.primeiro_nome_colaborador
            , fonte_colaboradores.sobrenome_colaborador
            , fonte_colaboradores.data_nascimento_colaborador
            , fonte_colaboradores.endereco_colaborador
            , fonte_colaborador_agencia.cod_agencia
        from fonte_colaboradores
        left join fonte_colaborador_agencia on
            fonte_colaboradores.cod_colaborador = fonte_colaborador_agencia.cod_colaborador
    )
select *
from joined_tabelas