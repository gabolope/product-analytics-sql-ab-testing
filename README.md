[Versión en español](README.es.md)

# Product Analytics: SQL and A/B Testing

Conversion funnel and retention analysis of an e-commerce store with SQL (BigQuery), plus the
analysis of a real A/B test. Work in progress.

## Data

- **Google Merchandise Store (GA4):** obfuscated sample of Google Analytics 4 events from the Google
  Merchandise Store, Nov 2020 - Jan 2021. Public dataset in BigQuery:
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce`.
  [Documentation](https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset).
  Query results are saved in `data/`.
- **Cookie Cats (A/B test):** "Mobile Games A/B Testing - Cookie Cats", Kaggle,
  [kaggle.com/datasets/yufengsui/mobile-games-ab-testing](https://www.kaggle.com/datasets/yufengsui/mobile-games-ab-testing).
  Player data from Cookie Cats, a mobile game by Tactile Entertainment, where the first gate was
  moved from level 30 to level 40. Saved in `data/cookie_cats.csv`.
