
#5 — PC vs Xbox One vs PS4 in NA
SELECT
  CASE
    WHEN console = 'PC'   THEN 'PC'
    WHEN console = 'XOne' THEN 'Xbox One'
    WHEN console = 'PS4'  THEN 'PS4'
    ELSE NULL
  END AS platform,
  ROUND(SUM(na_sales), 2) AS total_na_sales
FROM `jakemoneyorg.vgchartz.analysis_ox`
WHERE console IN ('PC','XOne','PS4')
GROUP BY platform
ORDER BY total_na_sales DESC;