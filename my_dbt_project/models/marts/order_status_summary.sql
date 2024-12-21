-- models/marts/order_status_summary.sql

select
    status,
    count(*) as total_orders,
    sum(order_amount) as total_amount
from
    {{ source('public', 'orders') }}
group by
    status
order by
    total_orders desc
