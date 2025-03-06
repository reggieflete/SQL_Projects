/*
**Question: What are the top-paying data analyst jobs?**

- Identify the top 10 highest-paying Analyst roles that are available in Canada.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Analysts.
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
