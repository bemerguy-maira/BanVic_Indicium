with
    fonte_colaborador_agencia as (
        select 
            cast(cod_colaborador as int) as cod_colaborador
            , cast(cod_agencia as int) as cod_agencia

        from {{ source( 'erp_ban_vic', 'colaborador_agencia') }}
    )

select *
from fonte_colaborador_agencia