/* Write your T-SQL query statement below */

-- Left Join + case 
SELECT
  s.user_id,
  CASE WHEN COUNT(c.user_id) = 0 THEN CAST(0.00 AS DECIMAL(4,2))
       ELSE ROUND( CAST(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS DECIMAL(10,4))
                   / COUNT(c.user_id), 2)
  END AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
  ON c.user_id = s.user_id
GROUP BY s.user_id;
