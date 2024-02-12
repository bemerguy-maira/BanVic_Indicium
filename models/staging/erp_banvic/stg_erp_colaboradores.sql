with
    fonte_colaboradores as (
        select 
            cast(cod_colaborador as int) as cod_colaborador
            , cast(primeiro_nome as string) as primeiro_nome_colaborador
            , cast(ultimo_nome as string) as sobrenome_colaborador
            --, cast(email as string) as email_colaborador
            --, cast(cpf as numeric) as dados_pessoais_colaborador
            , cast(data_nascimento as date) as data_nascimento_colaborador
            , cast(endereco as string) as endereco_colaborador
            --, cast(cep as numeric) as cep_colaborador

        from {{ source( 'erp_ban_vic', 'colaboradores') }}
    )

select *
from fonte_colaboradores