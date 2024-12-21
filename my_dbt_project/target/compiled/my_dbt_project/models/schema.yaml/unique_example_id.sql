
    
    

select
    id as unique_field,
    count(*) as n_records

from "sales_db"."public"."example"
where id is not null
group by id
having count(*) > 1


