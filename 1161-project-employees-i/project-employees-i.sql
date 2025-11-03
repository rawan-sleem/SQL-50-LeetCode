/* Write your T-SQL query statement below */

 -- Join + Avg 
select P.project_id   ,
round( 
     avg(E.experience_years * 1.00) 
    ,2)
 as  average_years
from Project as P 
join Employee as E 
on P.employee_id = E.employee_id
group by P.project_id
