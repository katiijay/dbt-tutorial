{{
  config(
    materialized='view'
  )
}}

SELECT 
 sk.skill_name
,sk.skill_use
,sk.skill_type
,jsm.usage_level
,jh.job_title
,jh.start
,jh.end
FROM {{ref('skills')}} sk
LEFT JOIN {{ref('job_skill_map')}} jsm
	ON jsm.skill_id = sk.Skill_ID
LEFT JOIN {{ref('job_history')}} jh
	ON jh.Job_ID = jsm.job_id