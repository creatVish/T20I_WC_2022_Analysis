SELECT * FROM t20i_summary.fact_bating_summary;

SELECT ROUND(AVG(balls), 2)  avg_ball_faced FROM fact_bating_summary;

SELECT ROUND(AVG(runs), 2) 	avg_batting_runs FROM fact_bating_summary;

SELECT DISTINCT battingPos, SUM(runs) AS 'total_runs'FROM fact_bating_summary
GROUP BY battingPos
ORDER BY total_runs DESC;

Alter TABLE fact_bating_summary  -- added a new columns called 'runs_by_boundary'-- 
ADD runs_by_boundary INT;
UPDATE fact_bating_summary  -- fill data sum of columns 4s(1 four = 4runs) and 6s(1 six = 6 runs) in runs_by_boundary -- 
SET runs_by_boundary = 4s * 4 + 6s * 6;
SELECT ROUND((SUM(runs_by_boundary) / SUM(runs)) * 100, 2) as 'boundary %' FROM fact_bating_summary;

SELECT DISTINCT batsmanName, ROUND(AVG(SR), 2) as 'avg_sr' 
FROM fact_bating_summary
GROUP BY batsmanName
HAVING SUM(balls) > 20
ORDER BY avg_sr DESC LIMIT 5;