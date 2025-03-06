/*
**Question: What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

--Top 100 highest paying analyst roles in Canada. (the data needs more input to have a better understanding of the job market)
SELECT
    job_id,
    job_title,
    name AS company_name,
    job_country,
    job_location,
    job_schedule_type,
    salary_year_avg,
    salary_hour_avg,
    salary_hour_avg * 2080 AS estimated_salary_year_avg, -- Assuming 2080 working hours in a year
    salary_rate,
    job_posted_date
FROM
    job_postings_fact
   LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Analyst%'
    AND salary_hour_avg IS NOT NULL
    AND job_country = 'Canada'
ORDER BY
    salary_hour_avg DESC
LIMIT 100;