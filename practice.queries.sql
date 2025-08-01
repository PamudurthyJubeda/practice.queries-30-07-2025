create database employee;
use employee;
create table employeetable(emp_id int primary key,first_name varchar(255),last_name varchar(255),salary int,joining_date date,department varchar(255));
insert into employeetable values(1,"Venkatesh","S",100000,"2015-08-28","BANKING");
insert into employeetable values(2,"Ragavi","P",75000,"2015-08-28","BUSINESS"),
(3,"Gopinath","C",50000,"2016-03-02","PHARMA"),
(4,"Dinesh","G",50000,"2016-03-02","INSURANCE"),
(5,"Saibabu","E",40000,"2017-07-08","SOFTWARE"),
(6,"Hasan","S",29000,"2017-07-08","MANUFACTURING"),
(7,"Divya","P",33000,"2017-07-08","HEALTHCARE"),
(8,"Aravindan","R", 40000,"2017-07-08","HEALTHCARE"),
(9,"Sathish","MD",45000,"2016/03/02","AUTOMOBILE"),
(10,"Prasanth","PKP",34000,"2016/03/02","INSURANCE"),
(11,"Vijay","R",25684,"2016/03/02","BUSINESS"),
(12,"Sivakumar","K",54789,"2016/03/02","SOFTWARE");
-- Get all employee details from the employee table
select * from employeetable;	
-- Get First_Name,Last_Name from employee table
select first_name ,last_name from employeetable;
-- Get First_Name from employee table using alias name “Employee Name”
select first_name as Employee_Name from employeetable;
-- Get First_Name from employee table in upper case
select upper(first_name) from employeetable;
-- Get First_Name from employee table in lower case
select lower(first_name) from employeetable;
-- Get unique DEPARTMENT from employee table
select distinct department from employeetable;
-- Select first 3 characters of FIRST_NAME from EMPLOYEE
select substring(first_name,1,3) from employeetable;
-- Get position of 'a' in name 'ragavi' from employee table
select position("a" in first_name) from employeetable;
--  Get FIRST_NAME from employee table after removing white spaces from right side
select rtrim(first_name) from employeetable;
-- Get FIRST_NAME from employee table after removing white spaces from left side
select ltrim(first_name) from employeetable;
-- Get length of FIRST_NAME from employee table
select length(first_name) from employeetable;
-- Get First_Name from employee table after replacing 'a' with '$'
select replace(first_name,"a","$") from employeetable;
-- Get First_Name and Last_Name as single column from employee table separated by a '_'
select concat(first_name,"_",last_name) from employeetable;
--  Get FIRST_NAME ,Joining year,Joining Month and Joining Date from employee table
select first_name,year(joining_date),month(joining_date),date(joining_date) from employeetable;
-- Get all employee details from the employee table order by First_Name Ascending
select * from employeetable order by first_name asc;
--  Get all employee details from the employee table order by First_Name descending
select * from employeetable order by first_name desc;
--  Get all employee details from the employee table order by First_Name Ascending and Salary descending
select * from employeetable order by first_name asc,salary desc;
-- Get employee details from employee table whose employee name is “Dinesh”
select * from employeetable where first_name = "DINESH";
-- Get employee details from employee table whose employee name are “Dinesh” and “Roy”
select * from employeetable where first_name = "DINESH" or first_name = "ROY";
-- Get employee details from employee table whose employee name are not “Dinesh” and “Roy”
select * from employeetable where not first_name = "DINESH" and not first_name = "ROY";
-- Get all the details of the employee whose salary is greater than 60000.
select * from employeetable where salary > 60000;
-- Get all the details of the employee whose salary is between 50000 to 70000
select * from employeetable where salary >= 50000 and salary <=70000;
--  Get first name and last name as single column separated by space of the employee whose salary is less than 50000
select concat(first_name,"_",last_name) from employeetable where salary < 50000;
-- Get first name and salary, arrange it by salary in ascending order.
select  first_name,salary from employeetable order by salary asc;
-- Get all the details of the employee whose salary is between 50000 to 70000 and arrange them by their first name as ascending order.
select * from employeetable where salary >=50000 and salary <=70000 order by first_name asc;
create table incentives(emp_id int,incentive_date date,incentive_amount int);
insert into incentives values(1,"2016-02-01",5000);
insert into incentives values(2,"2016-02-01",3000),
(3,"2017-02-01",4000),
(1,"2017-01-17",4500),
(2,"2017-01-01",3500);
select * from incentives;
-- Get the employee name ,add the salary and total incentive amount from incentive table use join with condition
select e.first_name,sum(e.salary+i.incentive_amount) from employeetable e join incentives i where e.emp_id = i.emp_id group by e.first_name,e.salary;
--  Select first_name, incentive amount from employee and incentives table for those employees who have incentives
 select e.first_name,i.incentive_amount from employee_details e join Incentive i where e.employee_id = i.employee_ref_id group by e.first_name,i.incentive_amount;
 -- Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
 select e.first_name,i.incentive_amount from employee_details e join Incentive i where e.employee_id = i.employee_ref_id and salary>3000 group by e.first_name,i.incentive_amount;
 -- Select first_name, incentive amount from employee and incentives table for all employes even if they didn't get incentives
 select e.first_name,i.incentive_amount from employee_details e join Incentive i where not e.employee_id = i.employee_ref_id group by e.first_name,i.incentive_amount;
 -- Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
 select e.first_name,ifnull((i.incentive_amount),0)  from employee_details e left join Incentive i on e.employee_id=i.employee_ref_id group by e.first_name,i.incentive_amount;
-- Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
 select e.first_name,(i.incentive_amount) from employee_details e left join Incentive i on e.employee_id=i.employee_ref_id group by e.first_name,i.incentive_amount;
--  Select max incentive with respect to employee from employee and incentives table using sub query
select e.first_name,max(i.incentive_amount) from employee_details e join Incentive i where e.employee_id=i.employee_ref_id group by e.first_name;

 





