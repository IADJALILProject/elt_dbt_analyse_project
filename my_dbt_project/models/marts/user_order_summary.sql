-- models/marts/user_order_summary.sql

with user_orders as (
    select
        u.id as user_id,
        u.name,
        u.email,
        o.order_amount,
        o.status,
        o.order_date
    from
        {{ source('public', 'users') }} u
    left join
        {{ source('public', 'orders') }} o
    on
        u.id = o.user_id
),

aggregated_data as (
    select
        user_id,
        name,
        email,
        count(*) as total_orders,
        sum(order_amount) as total_amount,
        max(order_date) as last_order_date
    from
        user_orders
    group by
        user_id, name, email
)

select * from aggregated_data
