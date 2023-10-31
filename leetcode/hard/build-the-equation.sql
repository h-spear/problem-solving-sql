-- https://leetcode.com/problems/build-the-equation/

select concat(group_concat(term separator ''), '=0') as equation
  from (select power
             , case when sum(factor) > 0
                    then concat('+', sum(factor), if(power > 0, 'X', ''), if(power > 1, concat('^', power), ''))  
                    when sum(factor) < 0 then concat(sum(factor), if(power > 0, 'X', ''), if(power > 1, concat('^', power), ''))  
                    else '.' end term
          from Terms
         group by power
         order by power desc) MyTerms
 where term != '.';