select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select email
from "sales_db"."public"."example"
where email is null



      
    ) dbt_internal_test