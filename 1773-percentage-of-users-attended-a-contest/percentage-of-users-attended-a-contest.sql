/* Write your T-SQL query statement below */

select 
R.contest_id , 
round(
      count(distinct R.user_id) *100.0 / (select Count(*) from Users)
     , 2)
     as percentage
from Register as R
join Users U on R.user_id = U.user_id
group by R.contest_id
order BY percentage DESC, R.contest_id ASC;
