-- 1. get me first 10 result of first_name and job_id.
select FIRST_NAME, JOB_ID
from EMPLOYEES
where ROWNUM <= 10;
-- 2. get me all employees whose salary is lower than average
select avg(salary)
from EMPLOYEES;
select FIRST_NAME, salary
from EMPLOYEES
where SALARY < (select avg(salary) from EMPLOYEES);

-- 3. get me those departments whose employees more than department 80
select count(DEPARTMENT_id)
from EMPLOYEES
where DEPARTMENT_id = 80;
select DEPARTMENT_ID
from EMPLOYEES
group by DEPARTMENT_ID
having count(DEPARTMENT_ID) > (select count(DEPARTMENT_id)
                               from EMPLOYEES
                               where DEPARTMENT_id = 80);

-- 4. get me those employees who is older than any IT programmer in the company
select min(HIRE_DATE)
from EMPLOYEES
where JOB_ID = 'IT_PROG';
select FIRST_NAME, HIRE_DATE
from EMPLOYEES
where HIRE_DATE < (select min(HIRE_DATE) from EMPLOYEES where JOB_ID = 'IT_PROG');

-- 5. get me first name and department name in same table
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES
         inner join DEPARTMENTS
                    on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 6. get me job id and manager id in one table
select JOB_ID, DEPARTMENTS.MANAGER_ID
from EMPLOYEES
         inner join DEPARTMENTS
                    on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
-- 7. get me department names and end date( if any employee quit)
select DEPARTMENT_NAME
from DEPARTMENTS;
select END_DATE
from JOB_HISTORY;
select DEPARTMENT_NAME, END_DATE
from DEPARTMENTS
         right join JOB_HISTORY
                    on DEPARTMENTS.DEPARTMENT_ID = JOB_HISTORY.DEPARTMENT_ID;

select DEPARTMENT_NAME, END_DATE
from DEPARTMENTS
         left join JOB_HISTORY
                   on DEPARTMENTS.DEPARTMENT_ID = JOB_HISTORY.DEPARTMENT_ID
where END_DATE is null;

--8. get me job id and job title together
select EMPLOYEEs.JOB_ID, JOB_TITLE
from EMPLOYEES
         join JOBS
              on EMPLOYEES.JOB_ID = JOBS.JOB_ID;
-- 9. get me first name who left the company
select FIRST_NAME, END_DATE
from EMPLOYEES
         right join JOB_HISTORY
                    on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

-- 10. get me first name and job title for those whose salary is equal to max salary of that job  title
select FIRST_NAME, JOB_TITLE, MAX_SALARY, salary
from EMPLOYEES
         right join JOBS
                    on EMPLOYEES.salary = jobs.MAX_SALARY;
select MAX_SALARY, JOB_TITLE
from JOBS;
select FIRST_NAME, salary
from EMPLOYEES;

--11.get me department name, city in same table
select DEPARTMENT_NAME, CITY
from DEPARTMENTS d
         join LOCATIONS l on l.LOCATION_ID = d.LOCATION_ID;
--12. get me first name , start date, end date in same table
select FIRST_NAME, START_DATE, END_DATE
from EMPLOYEES
         left join JOB_HISTORY
                   on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

--13. create a table name laptops, with id, brand, color, price
create table Laptops
(
    product_id INTEGER primary key,
    brand      varchar(30) not null,
    color      varchar(30) not null,
    price      INTEGER     not null
);
select *
from LAPTOPS;


--14. create table phones with id, brand, color, price
create table phones
(
    id    Integer primary key,
    brand varchar(25),
    color varchar(25),
    price integer

);
select *
from phones;


-- 15. insert laptops table belwo values

-- 1. (1, 'hp' , 'black', 1500)
-- 2. (2, 'msi', 'grey', 1300)
-- 3. (3, 'dell', 'black', 1600)
-- 4. (4, 'hp', 'white', 1300)
-- 5. (5, 'macbook', 'white', 1800)
insert into LAPTOPS
values (1, 'hp', 'black', 1500);
insert into LAPTOPS
values (2, 'msi', 'grey', 1300);
insert into LAPTOPS
values (3, 'dell', 'black', 1600);
insert into LAPTOPS
values (4, 'hp', 'white', 1300);
insert into LAPTOPS
values (5, 'macbook', 'white', 1800);

-- 16. insert phones table belwo values
-- -- 1. (1, 'samsung' , 'black', 700)
-- -- 2. (2, 'dell', 'grey', 1000)
-- -- 3. (3, 'msi', 'black', 800)
-- -- 4. (4, 'iphone', 'white', 1100)
insert into phones
values (1, 'samsung', 'black', 700);
insert into phones
values (2, 'dell', 'grey', 1000);
insert into phones
values (3, 'msi', 'black', 800);
insert into phones
values (4, 'iphone', 'white', 1100);

--17. update dell price to 1500
update Laptops
set price = 1500
where brand = 'dell';
-- 18. delete macbook from laptops table
delete LAPTOPS
where brand = 'macbook';
-- 19. combine all brand names in one table( from laptops and phones)
select brand
from LAPTOPS
union all
select brand
from phones;
-- 20. combine unique brand names in one table
select brand
from LAPTOPS
union
select brand
from phones;
--21. get me unique prices and sort them
select price
from LAPTOPS
union
select price
from phones;
--22. get me common colors for phones and laptops
select color from Laptops
intersect
select color from Phones;

--23. get me the colors only laptops have
select color from LAPTOPS
minus
select color from phones;
--24. get me the brands only phones have
select brand from phones
minus
select brand from LAPTOPS;
