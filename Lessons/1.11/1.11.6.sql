select 
    sd.skill_id,
    sd.skills,
    count(jpf.job_id) as job_count
from skills_dim as sd
right join skills_job_dim as sjd 
    on sjd.skill_id = sd.skill_id
right join job_postings_fact as jpf
    on jpf.job_id = sjd.job_id
where jpf.job_title_short like '%Data%'
group by sd.skill_id,
         sd.skills
order by job_count desc;



select
    sd.skill_id,
    sd.skills,
    count(jpf.job_id) as job_count 
from job_postings_fact as jpf
inner join skills_job_dim as sjd
    on sjd.job_id = jpf.job_id
inner join skills_dim sd
    on sd.skill_id = sjd.skill_id
where jpf.job_title_short like '%Data%'
group by sd.skill_id,
         sd.skills
order by job_count desc;



select jpf.job_id, sjd.skill_id
from job_postings_fact as jpf
full outer join skills_job_dim as sjd 
    on sjd.job_id = jpf.job_id
where sjd.skill_id is null
  and jpf.job_title_short like '%Data%';



select count(jpf.job_id) as CountNulls from job_postings_fact as jpf 
left join skills_job_dim sjd    
    on sjd.job_id = jpf.job_id
where skill_id is null
;

select 
(select count(distinct(job_id)) as cnt 
from skills_job_dim)
-
(select count(distinct(job_id)) as cnt2 
from job_postings_fact);


select sd.skill_id,sd.skills from skills_dim as sd
right join skills_job_dim as sjd
    on sjd.skill_id = sd.skill_id
where sjd.job_id is null;

select skill_id from skills_job_dim where job_id is null;

select count(distinct(skill_id)) from skills_dim;