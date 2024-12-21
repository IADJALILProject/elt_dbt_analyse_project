-- models/marts/sales_by_month.sql

with monthly_sales as (
    select
        date_trunc('month', order_date) as month,
        sum(order_amount) as total_sales,
        count(*) as total_orders
    from
        "sales_db"."public"."orders"
    where
        status = 'Completed'
    group by
        month
)

select
    month,
    total_sales,
    total_orders
from
    monthly_sales
order by
    month