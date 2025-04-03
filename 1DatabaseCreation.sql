CREATE DATABASE xyz;
USE xyz;
CREATE TABLE employee(id int PRIMARY KEY , name varchar(20) , salary int not null);
select *from employee;
insert into employee
(id , name , salary)
values
(1, "adam" , 25000),
(2, "bob",30000),
(3, "asey", 40000);

select * from employee;
