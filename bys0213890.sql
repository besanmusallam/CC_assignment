-- This query shows a list of the daily top Google Search terms.
SELECT
 t1.week AS Week,
 t1.term AS Top_Term,
 t1.rank
FROM `bigquery-public-data.google_trends.top_terms` t1
INNER JOIN (SELECT * FROM `bigquery-public-data.google_trends.term_categories`) AS t2
ON t1.term = table2.term 

WHERE
 rank = 3
 -- Choose only the top term each day.
 AND t1.week >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
--  AND WHERE t1.region = 'UK'    region does not exist
 -- Filter to the last 1 Month
GROUP BY Week, Top_Term, rank
ORDER BY Week DESC
 -- Show the days in reverse chronological order
