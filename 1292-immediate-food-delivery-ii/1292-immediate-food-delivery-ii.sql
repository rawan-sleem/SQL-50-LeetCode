/* Write your T-SQL query statement below */

-- Row_number()
WITH CTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date ASC, delivery_id ASC
        ) AS RN
    FROM Delivery
)
SELECT
    ROUND(
        ( SUM(
            CASE 
               WHEN CONVERT(date, order_date) = CONVERT(date, customer_pref_delivery_date)
                    THEN 1 
               ELSE 0 
            END
          ) * 1.0
          / NULLIF(COUNT(*), 0)
        ) * 100.0
    , 2) AS immediate_percentage
FROM CTE
WHERE RN = 1;
