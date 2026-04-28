select
    jpf.job_id,
    jpf.job_title,
    sd.skills,
    jpf.job_country
from job_postings_fact AS jpf
left join skills_job_dim AS sjd 
    on sjd.job_id = jpf.job_id
left join skills_dim sd 
    on sd.skill_id = sjd.skill_id
where jpf.job_country = 'United States'
  and jpf.job_health_insurance = true 
  and jpf.job_title_short = 'Data Engineer'
order by jpf.job_id desc;