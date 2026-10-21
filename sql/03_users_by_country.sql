-- Question: Which countries do users come from (Nov 2020 - Jan 2021)?

-- Finding: The US accounts for 44% of users, over 4x India (9%). The top 3 countries
--          (US, India, Canada) make up 61% and the top 10 make up 74%.

-- Since users may appear in two countries, we will count only the first country.
WITH ranked_events AS (
  SELECT
    ROW_NUMBER() OVER(PARTITION BY user_pseudo_id ORDER BY event_timestamp) AS rn,
    geo.country AS country,
    user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
),
user_country AS (
  SELECT
    country,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM ranked_events
  WHERE rn = 1
  GROUP BY country
)
SELECT 
  country, 
  users,
  ROUND(100 * users / SUM(users) OVER (), 1) AS pct_users
from user_country
ORDER BY users DESC
LIMIT 10
