with
    fonte_clientes as (
        select 
            cast(cod_cliente as int) as cod_cliente
            , cast(primeiro_nome as string) || ' ' || cast(ultimo_nome as string) as nome_cliente
           -- , cast(email as string) as email_cliente
            , cast(tipo_cliente as string) as tipo_cliente
            , cast(data_inclusao as date) as data_inclusao_cliente
           -- , cast(cpfcnpj as string) as dados_pessoais_cliente
            , cast(data_nascimento as date) as data_nascimento_cliente
            , cast(endereco as string) as endereco_cliente
           -- , cast(cep as string) as cep
        from {{ source( 'erp_ban_vic', 'clientes') }}
    )
select *
from fonte_clientes