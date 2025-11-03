/* Write your T-SQL query statement below */

-- Self Join 
select M.name 
From Employee as E 
join  Employee as M 
on E.managerId = M.id 
Group by M.id , M.name 
having count(E.id) >=5 
