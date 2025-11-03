/* Write your T-SQL query statement below */
select S.student_id , S.student_name , 
Sub.subject_name , count (Ex.student_id) as attended_exams 
From Students as S 
cross join Subjects as Sub
left join Examinations as Ex
on Ex.student_id = S.student_id and Ex.subject_name = Sub.subject_name
GROUP BY S.student_id, S.student_name, Sub.subject_name
order by S.student_id , Sub.subject_name