#2b - Top 10 highest-selling titles in North America
SELECT
  title,
  ROUND(SUM(na_sales), 2) AS total_na_sales
FROM `jakemoneyorg.vgchartz.analysis_ox`
GROUP BY title
ORDER BY total_na_sales DESC
LIMIT 10;
