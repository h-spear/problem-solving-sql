-- https://leetcode.com/problems/accepted-candidates-from-the-interviews/

select C.candidate_id
  from Candidates C
  join Rounds R
    on C.interview_id = R.interview_id
 where C.years_of_exp >= 2
 group by C.interview_id
having sum(R.score) > 15;