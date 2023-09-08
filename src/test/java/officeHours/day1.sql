-- 1. get me all data from employees table
select * from EMPLOYEES;
-- 2. get me first_name, phone_number and salary from employees
select FIRST_NAME, PHONE_NUMBER, SALARY from EMPLOYEES;
-- 3. get me unique job_id from _____ table
select distinct job_id from EMPLOYEES;
-- 4. get me all ST_CLERK from employee table
SELECT * from EMPLOYEES
WHere JOB_ID = 'ST_CLERK';
-- 5. get me postal_code from JP,UK,CA (solve in two different ways)
select POSTAL_CODE,COUNTRY_ID from LOCATIONS
where COUNTRY_ID = 'JP' OR COUNTRY_ID = 'UK' OR COUNTRY_ID = 'CA';

SELECT POSTAL_CODE, COUNTRY_ID FROM LOCATIONS
WHERE COUNTRY_ID IN ('JP','UK','CA');

-- 6. get me city not in CH,US
SELECT CITY, COUNTRY_ID FROM LOCATIONS
WHERE COUNTRY_ID NOT IN('CH','US');

-- 7. get me job_title whose min_salary is more than 4000 and less than 9000(solve in two different ways)
SELECT JOB_TITLE, MIN_SALARY FROM JOBS
WHERE MIN_SALARY > 4000 AND MIN_SALARY < 9000;

SELECT JOB_TITLE, MIN_SALARY FROM JOBS
WHERE MIN_SALARY BETWEEN 4000 AND 9000;

-- 8. get me null state_province in locations table
SELECT STATE_PROVINCE FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL;

-- 9. get me manager_id in departments table
select MANAGER_ID from DEPARTMENTS
where MANAGER_ID is not null;
-- 10. get me employee_id and start_date who starts in 2001
select EMPLOYEE_ID, HIRE_DATE from EMPLOYEES
where HIRE_DATE like '%2007%';
-- 11. get me all employee first_name who works in some CLERK position
select FIRST_NAME, JOB_ID from EMPLOYEES
where JOB_ID like '%CLERK';

-- 12. get me email whose email is 6 letter and 4th letter of email is E
SELECT EMAIL FROM EMPLOYEES
WHERE EMAIL LIKE '___E__';
-- 13. get me last_name according to their hire_date
select LAST_NAME, HIRE_DATE from EMPLOYEES
order by HIRE_DATE;

-- 14. get me first_name ascending and salary descending
select FIRST_NAME, SALARY from EMPLOYEES
order by FIRST_NAME asc , SALARY desc ;

-- 15. get me the number of manager_id from departments
select MANAGER_ID from DEPARTMENTS;
select count(MANAGER_ID) from DEPARTMENTS; -- count is not including null values

-- 16. get me maximum salary of IT_PROG
select max(SALARY) from EMPLOYEES
where JOB_ID = 'IT_PROG';

        -- average salary of ST_CLERK
select avg(salary) from EMPLOYEES
where JOB_ID = 'ST_CLERK';
-- 17. get me all city name uppercase and address lowercase
select upper(CITY), lower(STREET_ADDRESS) from LOCATIONS;
-- 18. get me every job_title length
select JOB_TITLE, length(JOB_TITLE) from JOBS;
        -- get me firstname + last name
select FIRST_NAME ||' '|| LAST_NAME as Full_Name from EMPLOYEES;
-- 19. get me maximum salary of each department_id
select max(SALARY),DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID;

-- 20. get me how many employees in each job_id
select JOB_Id, count(EMPLOYEE_ID) from EMPLOYEES
group by JOB_Id;

-- 21. get me salary information( min, max, sum, avg) of each job_id
select JOB_ID, min(SALARY),max(SALARY),avg(SALARY),sum(SALARY)from EMPLOYEES
group by JOB_ID;
-- 22. get me job_id that total salary is more than 50000
select JOB_ID, sum(salary) from EMPLOYEES
group by JOB_ID
having sum(SALARY) > 50000;
-- 24. get me which job_id has average commission_pct over 20%
select JOB_ID, avg(COMMISSION_PCT) from EMPLOYEES
group by JOB_ID
having avg(COMMISSION_PCT) > 0.2;

-- 25. get me each manager_id max salary and find out those more than 10000
select MANAGER_ID, max(salary) from EMPLOYEES
where MANAGER_ID is not null
group by MANAGER_ID
having max(SALARY) > 10000;







