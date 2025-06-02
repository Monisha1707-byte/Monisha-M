Create database Zoho; 
Use Zoho; 
Create table salesman ( 
Salesman_id int, 
Name varchar(100),
City varchar (100), 
Commission decimal (3,2)); 
Insert into salesman values ("5001","James hoog", "newyork", 0.15), (5002, "nailknite", "paris", 0.13), (5005, "pit alex","landon", 0.11),(5006,"MC Lyon","paris",0.14);
Insert into  salesman(salesman_id, name, commission) values(5003,"lauson hen", "0.12"); 
Insert into salesman value ( 5007, "paul", "adam rome", 0.13); 
Desc salesman; 
Select * from salesman;



Use Zoho; 
Create table customer( 
Customer_id int, 
Customer_name varchar (100), 
City varchar(100), 
Grade int, 
Salesman_id int);
Insert into customer values (3002, "Nick rimando", "newyork", 100, 5001),
 (3005, "Graham zusi", "California", 200, 5002); 
 Insert into customer(customer_id, customer_name, city) values(3001, "bardguzan", "Landon"); 
 Insert into customer values(3004,"frabian johns","paris", 300,5006); 
Insert into customer values (3007, "Brad davis", "paris",300,5001);
 Insert into customer(customer_id, customer_name, city) values(3009, "Geoff camero","Berlin"); 
Insert into customer values (3008, "Julian green", "Landon",300,5002);
 Insert into customer values(3003,"jony altidir","moncow",200,5007);
 desc customer;
 select*from customer;
 
 
 use zoho;
create table orders(
order_no int,
purch_amt decimal(10,2),
order_date date,
customer_id int,
salesman_id int);
show tables;
desc orders;
insert into orders values(70001,15.0,"2016-10-05",3005,5002);
insert into orders(order_no,purch_amt,order_date,customer_id) values(70009,270.0,"2016-09-10",3001);
insert into orders values(70002,65.26,"2016-10-05",3002,5001);
insert into orders(order_no,purch_amt,order_date,customer_id) values(70004,110.0,"2016-08-17",3009);
insert into orders values(70007,948.5,"2016-08-10",3005,5002),
(70005,2400.6,"2016-07-27",3007,5001),
(70008,5760,"2016-09-10",3002,5001),
(70010,1983.43,"2016-10-10",3004,5006);
insert into orders(order_no,purch_amt,order_date,customer_id) values(70003,2480.4,"2016-10-10",3009);
insert into orders values(70012,250.45,"2016-06-27",3008,5002),
(70011,75.29,"2016-08-17",3003,5007);
select * from orders;
#// query 1
select* from customer where city = "newyork" or grade >100;
#// query 2
select* from salesman where commission between 0.12 and 0.14;
#// query 3
select* from customer where customer_name like "n%";
#// query 4
select* from salesman where name like "n%" or "n___l%";
#// query 5
select * from customer where grade  is null;
#// query 6
select sum(purch_amt) from orders;
#// query 7
select count(salesman_id) from orders;
select count(distinct salesman_id) from orders;
#// query 8
select city, max(grade) from customer group by city;
#// query 9
select customer_id, max(purch_amt) from orders group by customer_id;
#// query 10
select  order_date,customer_id, max(purch_amt)from orders group by order_date,customer_id;
#// query 11
select salesman_id,max(purch_amt) from orders where order_date = "2016-08-17" group by salesman_id;
#// query 12
select customer_id,order_date, max(purch_amt) from orders group by customer_id,order_date having max(purch_amt)> 2000;
#// query 13
select count(order_no) from orders where order_date="2016-08-17";
#///
select customer.customer_name,salesman. name,salesman.city from customer,salesman WHERE customer.city=salesman.city;
#///
select customer.customer_name,salesman.name from customer,salesman WHERE customer.customer_id=salesman.salesman_id;
#///
select orders.order_no,customer.customer_name,orders.salesman_id,orders.salesman_id from orders,customer,salesman
WHERE salesman.city<> customer.city AND orders.customer_id=customer.customer_id AND orders.salesman_id=salesman.salesman_id;
#///
select* from orders where salesman_id=(select salesman_id from salesman where name="paul");
update salesman set name = "paul adam" where salesman_id = 5007;
update salesman set city = "rome" where salesman_id = 5007;
#///
select*from customer WHERE city="paris" and grade >= 300;
#/// subquery
select*from orders where (purch_amt) > (select avg(purch_amt) from orders  WHERE order_date = "2016-10-10");


