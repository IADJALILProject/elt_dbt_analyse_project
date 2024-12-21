
  create view "sales_db"."public"."example__dbt_tmp"
    
    
  as (
    -- dbt model example.sql

with raw_users as (
    -- Sélection des données brutes
    select
        id,
        name,
        email,
        is_active,
        created_at
    from
        public.users
),

active_users as (
    -- Filtrer les utilisateurs actifs
    select
        id,
        name,
        email,
        created_at
    from
        raw_users
    where
        is_active = true
)

-- Résultat final
select
    id,
    name,
    email,
    date_trunc('month', created_at) as signup_month
from
    active_users
  );