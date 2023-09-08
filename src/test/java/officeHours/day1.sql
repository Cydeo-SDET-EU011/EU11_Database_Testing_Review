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
-- 14. get me first_name ascending and salary descending
-- 15. get me the number of manager_id from departments
-- 16. get me maximum salary of IT_PROG
        -- average salary of ST_CLERK
-- 17. get me all city name uppercase and address losercase
-- 18. get me every job_title length
        -- get me firstname + last name
-- 19. get me maximum salary of each department_id
-- 20. get me how many employees in each job_id
-- 21. get me salary information( min, max, sum, avg) of each job_id
-- 22. get me job_id that total salary is more than 50000
-- 24. get me which job_id has average commission_pct over 20%
-- 25. get me each manager_id max salary and find out those more than 10000







