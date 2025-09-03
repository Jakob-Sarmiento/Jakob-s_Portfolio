#3b — Top 5 publishers in North America
SELECT
  publisher,
  ROUND(SUM(na_sales), 2) AS total_na_sales
FROM `jakemoneyorg.vgchartz.analysis_ox`
GROUP BY publisher
ORDER BY total_na_sales DESC
LIMIT 5;
