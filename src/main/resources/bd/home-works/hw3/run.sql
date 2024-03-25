select id, start_date
from s_emp;

select id, last_name, start_date, trunc(months_between(to_date('25.02.2024', 'DD.MM.YYYY'), start_date) / 12, 0) years
from s_emp;

select trunc(months_between(sysdate, to_date('24.04.2004', 'DD.MM.YYYY')) / 12, 0) years,
       trunc(mod(months_between(sysdate, to_date('24.04.2004', 'DD.MM.YYYY')), 12)) months,
       trunc(sysdate - add_months(to_date('24.04.2004', 'DD.MM.YYYY'), months_between(sysdate, to_char(to_date('24.04.2004', 'DD.MM.YYYY'))))) as days
from dual;

select extract(year from START_DATE) "year of employment", count(id) employees from S_EMP
group by extract(year from START_DATE);