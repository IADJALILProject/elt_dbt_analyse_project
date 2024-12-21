
  create view "sales_db"."public"."order_status_summary__dbt_tmp"
    
    
  as (
    -- models/marts/order_status_summary.sql

select
    status,
    count(*) as total_orders,
    sum(order_amount) as total_amount
from
    "sales_db"."public"."orders"
group by
    status
order by
    total_orders desc
  );