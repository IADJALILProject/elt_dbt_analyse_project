select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select frequency_segment
from "sales_db"."public"."user_segmentation"
where frequency_segment is null



      
    ) dbt_internal_test