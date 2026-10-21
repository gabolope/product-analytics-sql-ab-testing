[English version](README.md)

# Product Analytics: SQL y A/B testing

Análisis del funnel de conversión y la retención de un e-commerce con SQL (BigQuery), y análisis de
un A/B test real. En desarrollo.

## Datos

- **Google Merchandise Store (GA4):** muestra ofuscada de eventos de Google Analytics 4 de la tienda
  de merchandising de Google, nov 2020 - ene 2021. Dataset público en BigQuery:
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce`.
  [Documentación](https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset).
  Los resultados de las queries están en `data/`.
- **Cookie Cats (A/B test):** "Mobile Games A/B Testing - Cookie Cats", Kaggle,
  [kaggle.com/datasets/yufengsui/mobile-games-ab-testing](https://www.kaggle.com/datasets/yufengsui/mobile-games-ab-testing).
  Datos de jugadores de Cookie Cats, un juego mobile de Tactile Entertainment, donde la primera
  barrera se movió del nivel 30 al 40. Guardado en `data/cookie_cats.csv`.
