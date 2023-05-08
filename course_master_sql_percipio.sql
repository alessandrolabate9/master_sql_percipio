select *
from employees e right outer join jobs j ON(e.job_id=j.job_id


-- WORKING WITH SUBQUERIES

-- single row subqueries
select last_name, job_id
from employees 
where job_id =(
select job_id
from employees
where employee_id=141); 

-- group funct in subqueries
select employee_id, last_name, salary
from employees
where salary <= (select round(avg(salary),0)
from employees)
order by salary desc;

--troubleshooting
--no rows are returned in subquery
select *
from employees
where job_id = (
select job_id 
from employees
where last_name = 'Haas');

-- any and all operator
select *
from employees
where commission_pct > ANY (
                            SELECT commission_pct
                            from employees
                            where job_id='SA_REP');
                                    

-- multiple column subqueries
select * 
from employees
where (salary, department_id) IN (
                                    select max(salary), department_id
                                    from employees
                                    group by department_id)
order by department_id;

-- null values in subquery
-- null return null output
select emp.last_name
from employees emp
where emp.employee_id not IN (SELECT manager_id from employees);

-- null in subquery return results in output
select emp.last_name
from employees emp
where emp.employee_id not IN (SELECT manager_id from employees where manager_id is not null);




-- INTERSECT
SELECT employee_id
from employees
where job_id='FU_CLERK'
INTERSECT
select employee_id
FROM employees
WHERE department_id=30;
