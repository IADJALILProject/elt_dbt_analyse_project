select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select status
from "sales_db"."public"."order_status_summary"
where status is null



      
    ) dbt_internal_test