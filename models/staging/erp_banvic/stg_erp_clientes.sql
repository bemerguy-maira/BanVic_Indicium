with
    fonte_clientes as (
        select 
            cast(cod_cliente as int) as cod_cliente
            , cast(primeiro_nome as string) as primeiro_nome
            , cast(ultimo_nome as string) as sobrenome
           -- , cast(email as string) as email
            , cast(tipo_cliente as string) as tipo_cliente
            , cast(data_inclusao as string) as data_inclusao
           -- , cast(cpfcnpj as string) as dados_pessoais
            , cast(data_nascimento as date) as data_nascimento
            , cast(endereco as string) as endereco
           -- , cast(cep as string) as cep
        from {{ source( 'erp_ban_vic', 'clientes') }}
    )
select *
from fonte_clientes