/* Write your T-SQL query statement below */


--Left Join + be sure the date + return 0 not null => use COALESCE

select P.product_id , 
   coalesce(round(
    cast(sum(P.price * U.units) as decimal (10 , 2)) / 
    nullif(sum(u.units) , 0), 2 
  ) , 0)
   as average_price
  FROM Prices as P
  left join UnitsSold u
  on P.product_id = u.product_id and 
   u.purchase_date BETWEEN P.start_date AND P.end_date
  group by P.product_id 

