
#4 — NA Sales Increase/Decrease
WITH parsed AS (
  SELECT
    *,
    EXTRACT(YEAR FROM SAFE.PARSE_DATE('%Y-%m-%d', release_date)) AS year_
  FROM `jakemoneyorg.vgchartz.analysis_ox`
),
per_decade AS (
  SELECT
    (CAST(year_ AS INT64) / 10) * 10 AS decade_start,
    ROUND(SUM(na_sales), 2) AS total_na_sales
  FROM parsed
  WHERE year_ IS NOT NULL
  GROUP BY decade_start
),
with_lag AS (
  SELECT
    decade_start,
    CONCAT(CAST(decade_start AS STRING), 's') AS decade_label,
    total_na_sales,
    LAG(total_na_sales) OVER (ORDER BY decade_start) AS prev_decade_sales
  FROM per_decade
)
SELECT
  decade_start,  
  decade_label,
  total_na_sales,
  CASE
    WHEN prev_decade_sales IS NULL OR prev_decade_sales = 0 THEN NULL
    ELSE ROUND(((total_na_sales - prev_decade_sales) * 100.0 / prev_decade_sales), 2)
  END AS growth_vs_prev_decade_pct
FROM with_lag
WHERE decade_start BETWEEN 2000 AND 2020
ORDER BY decade_start;
