-- Question: What share of sessions comes from each device category (Nov 2020 - Jan 2021)?

-- Finding: Most sessions occur on desktop (58%), then mobile (40%) and last tablet (2%).

-- Sessions are counted (not users) because a session happens on a single device,
-- so groups don't overlap and the percentages add up to 100.
WITH device_sessions AS (
  SELECT
    device.category AS device,
    COUNT(DISTINCT CONCAT(CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING), '-', user_pseudo_id)) AS sessions
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
  GROUP BY device
)
SELECT
  device,
  sessions,
  ROUND(100 * sessions / SUM(sessions) OVER (), 1) AS pct_sessions
FROM device_sessions
ORDER BY sessions DESC
