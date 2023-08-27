-- between
select FIRST_NAME, salary from EMPLOYEES
where SALARY >2000 and SALARY < 6000;

select FIRST_NAME, SALARY from EMPLOYEES
where SALARY between 2000 and 6000;

-- in
select LOCATION_ID, COUNTRY_ID from LOCATIONS
where COUNTRY_ID='JP' or COUNTRY_ID ='UK' or COUNTRY_ID = 'US';

select LOCATION_ID, COUNTRY_ID from LOCATIONS
where COUNTRY_ID in ('JP','UK','US');

-- NOT IN
select LOCATION_ID, COUNTRY_ID from LOCATIONS
where COUNTRY_ID not in ('IT');

-- like
-- %
select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'Ad%';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'Va%';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like '%m';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'A%r';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like '%as%';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like '%aa%' or FIRST_NAME like '%a%a%';

--  _
select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'A___';

select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like 'B_r____';

select LAST_NAME from EMPLOYEES
where  LAST_NAME like '______';

select FIRST_NAME from EMPLOYEES
where FIRST_NAME like 'D__%_';

-- aggrate functions
-- min
select min(salary) from EMPLOYEES;

--max
select max(salary) from EMPLOYEES;

select min(salary),max(salary) from EMPLOYEES;

-- avg and round
select avg(salary) from EMPLOYEES;

select round(avg(salary))from EMPLOYEES;

select round(avg(salary),0) from EMPLOYEES;

--sum
select sum(salary) from EMPLOYEES;

-- group by
select count(FIRST_NAME),DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID;

select max(SALARY),DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID;

select count(JOB_ID) from EMPLOYEES;
select distinct JOB_ID from EMPLOYEES;

select JOB_ID from EMPLOYEES;
select JOB_ID from EMPLOYEES
group by JOB_ID;

select JOB_ID, round(avg(salary))from EMPLOYEES
group by JOB_ID;

select DEPARTMENT_ID , sum(SALARY) from EMPLOYEES
group by DEPARTMENT_ID;

select DEPARTMENT_ID , sum(SALARY) from EMPLOYEES
group by DEPARTMENT_ID
having sum(salary) < 20000;

-- difference between having and where
-- where is put condition before group, applies to individual rows
-- having is put condition after group, applies to grouped rows

select DEPARTMENT_ID, count(SALARY) from EMPLOYEES
group by DEPARTMENT_ID
having count(salary) < 20;

-- row number
select FIRST_NAME from EMPLOYEES
where ROWNUM <= 10;

select FIRST_NAME from EMPLOYEES
where ROWNUM < 11;

-- subquery
select max(salary) from EMPLOYEES;

select FIRST_NAME, LAST_NAME,salary from EMPLOYEES
where SALARY = (select max(salary) from EMPLOYEES);

select FIRST_NAME, LAST_NAME, salary from EMPLOYEES
where SALARY = (select min(salary) from EMPLOYEES);


select round(avg(salary)) from EMPLOYEES;

select FIRST_NAME, salary from EMPLOYEES
where SALARY > (select round(avg(salary)) from EMPLOYEES);


--find out second highest salary
select max(salary) from EMPLOYEES
where salary < (select max(salary) from EMPLOYEES);

select max(salary) from EMPLOYEES
where salary != (select max(salary) from EMPLOYEES);

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY = (select max(salary) from EMPLOYEES
                where salary != (select max(salary) from EMPLOYEES));