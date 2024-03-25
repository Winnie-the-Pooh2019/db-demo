select dept_id, count(id) "employees count"
from s_emp
group by dept_id;

select sales_rep_id, count(id) "orders amount", sum(total) "orders summary"
from s_ord
group by sales_rep_id;

select sales_rep_id, count(id) "customer amount"
from s_customer
where sales_rep_id is not null
group by sales_rep_id;

select extract(year from start_date) "year of employement", count(id) employees
from s_emp
group by extract(year from start_date);