-- Question: How do daily users, sessions and events evolve from Nov 2020 to Jan 2021?

-- Finding: Activity peaks in early December (~4,900 daily users, 7-day avg) and Black Friday
--          shows no effect. Weekends have ~30% fewer users. January stays above November.

-- All users who have activity and events in time window
SELECT 
  PARSE_DATE('%Y%m%d', event_date) AS event_day,
  COUNT(DISTINCT user_pseudo_id) AS users, 
  COUNT(*) AS events,
  COUNT(DISTINCT CONCAT(CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING), '-', user_pseudo_id)) AS sessions
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
GROUP BY event_day 
ORDER BY event_day