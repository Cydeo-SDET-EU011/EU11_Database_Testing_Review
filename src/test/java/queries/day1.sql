
-- get all data from table
select * from EMPLOYEES;
-- username: hr
-- password: hr

-- get specific columns from  table
select EMPLOYEE_ID,FIRST_NAME, LAST_NAME from EMPLOYEES;
select COUNTRY_ID,REGION_ID from COUNTRIES;
-- shortcut to run query, ctrl + Enter(windows), cmd + Enter(mac)


-- distinct  return unique data
select distinct FIRST_NAME from EMPLOYEES;
select distinct REGION_ID from REGIONS;

-- where statement
select SALARY from EMPLOYEES
where SALARY > 5000;

select EMPLOYEE_ID,FIRST_NAME, MANAGER_ID from EMPLOYEES
where MANAGER_ID = 100;

select FIRST_NAME, LAST_NAME,HIRE_DATE from EMPLOYEES
where HIRE_DATE > '12-05-2002';


select EMPLOYEE_ID,FIRST_NAME, MANAGER_ID from EMPLOYEES
where MANAGER_ID = 100 or MANAGER_ID = 103;

select EMPLOYEE_ID,FIRST_NAME, MANAGER_ID from EMPLOYEES
where MANAGER_ID = 100 and MANAGER_ID = 103;

-- count statement
select count(*) from EMPLOYEES;
select * from EMPLOYEES;

select count(distinct FIRST_NAME) from EMPLOYEES;
select COMMISSION_PCT from EMPLOYEES;
select count(COMMISSION_PCT) from EMPLOYEES;
-- count statement is not counting the null data.


-- order by
select SALARY from EMPLOYEES
order by salary asc ;

select salary from EMPLOYEES
order by SALARY desc ;

select salary from EMPLOYEES
order by salary;
-- order by is sorting ascending way in default.

select FIRST_NAME, LAST_NAME from EMPLOYEES
order by FIRST_NAME;

select FIRST_NAME, LAST_NAME from EMPLOYEES
order by FIRST_NAME desc ,LAST_NAME asc ;




