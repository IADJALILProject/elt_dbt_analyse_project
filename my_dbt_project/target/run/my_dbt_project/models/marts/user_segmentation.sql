
  create view "sales_db"."public"."user_segmentation__dbt_tmp"
    
    
  as (
    -- models/marts/user_segmentation.sql

with user_rfm as (
    select
        u.id as user_id,
        u.name,
        u.email,
        max(o.order_date) as last_order_date,
        count(*) as total_orders,
        sum(o.order_amount) as total_spent
    from
        "sales_db"."public"."users" u
    left join
        "sales_db"."public"."orders" o
    on
        u.id = o.user_id
    group by
        u.id, u.name, u.email
),

user_segments as (
    select
        user_id,
        name,
        email,
        last_order_date,
        total_orders,
        total_spent,
        case
            when total_spent > 1000 then 'High Value'
            when total_spent between 500 and 1000 then 'Medium Value'
            else 'Low Value'
        end as value_segment
    from
        user_rfm
)

select * from user_segments
  );