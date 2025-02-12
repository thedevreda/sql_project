/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
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
LIMIT 5;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/