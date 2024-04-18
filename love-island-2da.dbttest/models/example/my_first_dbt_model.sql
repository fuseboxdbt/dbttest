
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{{ dbt_utils.import }}


{{ config(materialized='table') }}


with source_data as (

select *
from {{ dbt_utils.gcs_source(
  'gs://fuseboxgames-code-testing/silver/appsflyer/cohort/kpi/af_purchase/LoveIsland_ios/*.snappy.parquet',
  file_format='parquet'
) }}

)

select pid
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
