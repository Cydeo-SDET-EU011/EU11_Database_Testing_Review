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

-- string functions
-- concatination  ||
select FIRST_NAME, LAST_NAME from EMPLOYEES;
select FIRST_NAME || LAST_NAME from EMPLOYEES;
select FIRST_NAME ||' '|| LAST_NAME from EMPLOYEES;

select email from EMPLOYEES;
select email||'@gmail.com' from EMPLOYEES;

--lower and upper
select lower(email) from EMPLOYEES;
select upper(FIRST_NAME)from EMPLOYEES;

select FIRST_NAME ||' '|| upper(LAST_NAME) from EMPLOYEES;

-- initcap
select initcap(EMAIL) from EMPLOYEES;

--substr
select FIRST_NAME, substr(FIRST_NAME,1,3) from EMPLOYEES;
select STREET_ADDRESS, substr(STREET_ADDRESS, 3,5) from LOCATIONS;

-- virtual table
create view fullName as select FIRST_NAME ||' '|| upper(LAST_NAME) as fullname from EMPLOYEES;

create view email as select FIRST_NAME ||'.'||LAST_NAME||'@gmail.com' as email from EMPLOYEES;

-- join

-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table


-- inner join
select COUNTRY_ID from COUNTRIES;
select REGION_ID from REGIONS;

select COUNTRY_NAME , region_name from COUNTRIES
inner join REGIONS
on COUNTRIES.REGION_ID = REGIONS.REGION_ID;

select city, COUNTRY_NAME from COUNTRIES
inner join LOCATIONS
on COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID;

-- left join
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from EMPLOYEES
left join DEPARTMENTS
on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from EMPLOYEES e
left join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from EMPLOYEES e
                                                       left join DEPARTMENTS d
                                                                 on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where DEPARTMENT_NAME = 'Shipping';

-- right join
select FIRST_NAME , END_DATE from EMPLOYEES
left join JOB_HISTORY
on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;


select FIRST_NAME , END_DATE from EMPLOYEES
right join JOB_HISTORY
on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

select FIRST_NAME , END_DATE from EMPLOYEES
                                      right join JOB_HISTORY
                                                 on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID
where FIRST_NAME like '___';

--outer join
select DEPARTMENT_NAME, CITY from DEPARTMENTS
full outer join LOCATIONS
on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

select DEPARTMENT_NAME, CITY from DEPARTMENTS
                                      full outer join LOCATIONS
                                                      on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
where CITY = 'Seattle';

-- self join
select e1.FIRST_NAME, e1.last_name, e1.EMPLOYEE_ID, e2.MANAGER_ID from EMPLOYEES e1
join EMPLOYEES e2
on e1.EMPLOYEE_ID = e2.MANAGER_ID;

SELECT e1.first_name, e1.last_name, e1.manager_id, e2.last_name
FROM employees e1 JOIN employees e2
                       ON e1.manager_id = e2. employee_id;




