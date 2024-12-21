select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_sales
from "sales_db"."public"."sales_by_month"
where total_sales is null



      
    ) dbt_internal_test