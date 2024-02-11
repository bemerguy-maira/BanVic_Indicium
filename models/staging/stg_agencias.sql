with
    fonte as (
        select 
            cod_agencia
            , nome
            , endereco
            , cidade
            , uf
            , cast(data_abertura as date) as data_abertura
            , tipo_agencia

        from {{ source( 'erp_ban_vic', 'agencia') }}
    )

select *
from fonte