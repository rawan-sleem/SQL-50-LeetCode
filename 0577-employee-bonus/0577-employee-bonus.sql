/* Write your T-SQL query statement below */
Select E.name , B.bonus  
from Employee E
left join Bonus B 
on B.empId = E.empId
where B.bonus is null or  B.bonus <1000  