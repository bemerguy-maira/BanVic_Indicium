with
    fonte_agencias as (
        select *
        from {{ ref('stg_erp_agencias') }}
    )

select *
from fonte_agencias