/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, 
    offering insights into employment options and location flexibility.
*/



SELECT 
    company_dim.name AS Company,
    job_title,
    salary_year_avg,
    job_location,
    job_posted_date::DATE
FROM job_postings_fact as top_paying_jobs
LEFT JOIN company_dim -- Joing to include the company name
    ON top_paying_jobs.company_id = company_dim.company_id
WHERE 
    job_work_from_home = TRUE AND -- remote jobs filter
    salary_year_avg IS NOT NULL AND -- remove nulls
    job_title_short LIKE 'Data Ana%' AND -- specify onyl DA
    job_location = 'Anywhere' -- Location flexibility
ORDER BY salary_year_avg DESC
LIMIT 10;

    
