-- Question: Which channels do users come from (Nov 2020 - Jan 2021)?

-- Finding: Organic search brings 38% of users, direct traffic 24% and referrals 15%.
--          Paid search (cpc) brings only 5%. 18% of users have an obfuscated medium
--          (<Other>, data deleted), so channel shares are approximate.

-- 15% of users (41k) appear with more than one medium, so each user is assigned
-- the medium of their first event (first-touch attribution).
WITH ranked_events AS (
  SELECT
    ROW_NUMBER() OVER(PARTITION BY user_pseudo_id ORDER BY event_timestamp) AS rn,
    traffic_source.medium AS channel,
    user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
),
user_channel AS (
  SELECT
    channel,
    COUNT(DISTINCT user_pseudo_id) AS users
  from ranked_events
  WHERE rn = 1
  GROUP BY channel
)
SELECT 
  channel,
  users,
  ROUND(100 * users / SUM(users) OVER(), 1) AS pct_users
FROM user_channel
ORDER BY users DESC
LIMIT 10
