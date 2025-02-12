/*
    What skills are most in demand for data analysts?
*/



SELECT 
    skills,
    COUNT(*) as skill_count -- everything is on DA and skills will be in order with it so we count it all
FROM job_postings_fact
-- Joing all the three table to include the company name
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id -- to joining job_id skill_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- to inclding the skills
WHERE 
    job_title_short LIKE 'Data Analyst'  -- specify onyl DA
GROUP BY skills -- grouping by skills to show only unique skills
ORDER BY skill_count DESC
LIMIT 5

