/* Write your T-SQL query statement below */

SELECT T.id
FROM Weather T
JOIN Weather Y 
    ON T.recordDate = DATEADD(DAY, 1, Y.recordDate)
WHERE T.temperature > Y.temperature;
