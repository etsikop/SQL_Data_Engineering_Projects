select 
    table_name, 
    constraint_name,
    count(constraint_name) as constraint_name_count
from information_schema.key_column_usage 
where table_catalog = 'data_jobs'
group by table_name, constraint_name
having constraint_name_count>1;