select
    jpf.job_title_short,
    sd.skills,
    count(jpf.job_id) as job_count 
from job_postings_fact as jpf
inner join skills_job_dim as sjd
    on sjd.job_id = jpf.job_id
inner join skills_dim sd
    on sd.skill_id = sjd.skill_id
where jpf.salary_year_avg > 100000
group by jpf.job_title_short,
         sd.skills
order by job_count desc;