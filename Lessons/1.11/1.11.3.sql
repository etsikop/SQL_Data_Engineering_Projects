select
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    sjd.skill_id
from job_postings_fact as jpf
full outer join skills_job_dim as sjd
    on sjd.job_id = jpf.job_id
where jpf.job_country = 'United States'
order by jpf.job_id, sjd.skill_id;