#1b - Top 5 highest selling genres in North America
SELECT genre,
       ROUND(SUM(na_sales), 2) AS total_na_sales
FROM `jakemoneyorg.vgchartz.analysis_ox`
GROUP BY genre
ORDER BY total_na_sales DESC
LIMIT 5;