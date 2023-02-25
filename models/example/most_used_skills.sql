{{
  config(
    materialized='view'
  )
}}

SELECT 
skill_name
,SUM(Duration_Months*usage_level) AS usage_months_aggregation
FROM resume_dev.skills sk
LEFT JOIN resume_dev.job_skill_map jsm
	ON jsm.skill_id = sk.Skill_ID
LEFT JOIN resume_dev.job_history jh
	ON jh.Job_ID = jsm.job_id
GROUP BY skill_name
ORDER BY usage_months_aggregation DESC