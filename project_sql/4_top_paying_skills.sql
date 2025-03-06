-- Calculates the average salary for job postings by individual skill 
SELECT
  skills_dim.skills AS skill, 
  ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary,
  ROUND(AVG(job_postings_fact.salary_hour_avg),2) AS avg_salary_hourly
FROM
  job_postings_fact
	INNER JOIN
	  skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	INNER JOIN
	  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_postings_fact.job_title_short LIKE '%Analyst%' 
  AND job_postings_fact.salary_hour_avg IS NOT NULL 
  AND job_postings_fact.job_country = 'Canada'
  --AND job_work_from_home = True  -- optional to filter for remote jobs
GROUP BY
  skills_dim.skills 
ORDER BY
  avg_salary_hourly DESC; 