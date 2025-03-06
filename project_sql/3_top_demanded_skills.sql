-- Identifies the top 5 most demanded skills for Analyst job postings in Canada
SELECT
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count
FROM
  job_postings_fact
  INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  -- Filters job titles for 'Analyst' roles in Canada
  job_postings_fact.job_title LIKE '%Analyst%'
    AND salary_hour_avg IS NOT NULL
    AND job_country = 'Canada'
	-- AND job_work_from_home = True -- optional to filter for remote jobs
GROUP BY
  skills_dim.skills
ORDER BY
  demand_count DESC
LIMIT 20;