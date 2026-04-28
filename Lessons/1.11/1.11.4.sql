select
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills,
    count(jpf.job_id) as job_count 
from job_postings_fact as jpf
left join skills_job_dim as sjd
    on sjd.job_id = jpf.job_id
left join skills_dim sd
    on sd.skill_id = sjd.skill_id
where jpf.job_title_short like '%Data%'
group by jpf.job_title_short, sjd.skill_id, sd.skills
order by job_count desc;