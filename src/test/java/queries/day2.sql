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