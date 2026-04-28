select
     jpf.job_id
    ,jpf.job_title
    ,cd.name as company_name
    ,jpf.job_location
    ,jpf.job_posted_date
from job_postings_fact as jpf
inner join company_dim as cd 
    on cd.company_id = jpf.company_id
where jpf.job_title_short = 'Data Engineer'
order by jpf.job_posted_date desc;