create database Pizza_And_Chill
use Pizza_And_Chill

create table Department(
deptt_no int constraint pk1 primary key,
Types varchar(50),
hod varchar(50),
deptt_salary bigint)

create table Customer(
cust_no int constraint pk2 primary key,
cust_name varchar(50),
cust_address varchar(50),
cust_phone bigint,
no_of_orders bigint,
ratings int)

create table Branches(
bran_no int constraint pk3 primary key,
bran_name varchar(50),
region varchar(50),
phone bigint,
no_of_employees bigint,
manager_no int,
manager varchar(50),
bran_expenditure bigint,
tot_revenue bigint)

create table Employees(
bn1 int,
dn1 int,
emp_no int,
emp_name varchar(50),
emp_address varchar(50),
emp_email varchar(50),
emp_salary bigint,
emp_phone bigint,
gender varchar(50),
recruit_date date,
constraint fk1 foreign key(bn1) references Branches(bran_no),
constraint worksin foreign key(dn1) references Department(deptt_no),
constraint p1k primary key(emp_no))

create table Orders(
od int,
dlno int,
cno int,
brno int,
ord_no int,
ord_type varchar(50),
extra_ingredients varchar(50),
tot_price bigint,
constraint place foreign key(cno) references Customer(cust_no),
constraint takenat foreign key(brno) references Branches(bran_no),
constraint appliedon foreign key(dlno) references Deals(deal_no),
constraint takenby foreign key(od) references deptt_orders(do),
constraint p5k primary key(ord_no))

create table Employee_Work_Hrs(
enum int,
emp_date date,
in_time time,
out_time time,
constraint worksfor foreign key(enum) references Employees(emp_no),
constraint pk primary key(enum))

create table Food_Items(
item_no int constraint pk6 primary key,
item_name varchar(50),
veg_non varchar(50),
spicy_non varchar(50),
price bigint,
item_type varchar(50))

create table Ingredients(
ingr_no int constraint pk7 primary key,
ingr_name varchar(50),
ingr_type varchar(50),
price bigint)

create table Inventory(
ingrno int,
inven_no int,
qty_rqd bigint,
qty_present bigint,
price bigint,
constraint monitors_ingr foreign key(ingrno) references Ingredients(ingr_no),
constraint p2k primary key(inven_no))

create table Deliveries(
dl int,
bn2 int,
empno int,
transport varchar(50),
constraint fk2 foreign key(bn2) references Branches(bran_no),
constraint fk3 foreign key(empno) references Employees(emp_no),
constraint delivers foreign key(dl) references deptt_delivery(dd))

create table Deals(
deal_no int,
itemno int,
deal_name varchar(50),
deal_descrip varchar(50),
discounted_price bigint,
constraint fk4 foreign key(itemno) references Food_Items(item_no),
constraint p3k primary key(deal_no))

create table Logistics(
invno int,
ingrno int,
invenno int,
log_no int,
log_name varchar(50),
log_type varchar(50),
constraint monitors_ing foreign key(ingrno) references Ingredients(ingr_no),
constraint funds_inven foreign key(invenno) references Inventory(inven_no),
constraint monitors_log foreign key(invno) references Inventory(inven_no),
constraint p4k primary key(log_no))

create table Finance(
inv_no int,
ordno int,
logno int,
tran_no int,
inflow bigint,
outflow bigint,
balance bigint,
constraint funds_logis foreign key(logno) references Logistics(log_no),
constraint inflow foreign key(ordno) references Orders(ord_no),
constraint funds_fin foreign key(inv_no) references Inventory(inven_no),
constraint p6k primary key(tran_no))

create table Complaints(
bno3 int,
cnum int,
comp_no int,
category varchar(50),
comp_descrip varchar(50),
comp_status varchar(50),
constraint fk5 foreign key(bno3) references Branches(bran_no),
constraint logs foreign key(cnum) references Customer(cust_no),
constraint p9k primary key(comp_no))

create table have(
dn int,
bn int,
constraint fkd foreign key(dn) references Department(deptt_no),
constraint fkb foreign key(bn) references Branches(bran_no))

create table requires(
bnum int,
lognum int,
constraint fkbr foreign key(bnum) references Branches(bran_no),
constraint fkl foreign key(lognum) references Logistics(log_no))

create table compriseof(
ono int,
ino int,
constraint fko foreign key(ono) references Orders(ord_no),
constraint fki foreign key(ino) references Food_Items(item_no))

create table req(
inno int,
fino int,
constraint fkin foreign key(inno) references Ingredients(ingr_no),
constraint fkfi foreign key(fino) references Food_Items(item_no))

create table deptt_delivery(
dd int constraint pkdd primary key)

create table deptt_kitchen(
dk int constraint pkdk primary key)
select * from deptt_orders
create table deptt_orders(
do int constraint pkdo primary key)

use Pizza_And_Chill

insert into Department(deptt_no, Types, hod, deptt_salary) 
values(1, 'Kitchen', 'Manish', 10000),
(2, 'Delivery', 'Ram', 5000),
(3, 'Orders', 'Param', 7500)

insert into Customer(cust_no, cust_name, cust_address,cust_phone, no_of_orders, ratings)
values(1, 'Anirudh', 'Sector 72', 9827364738 , 8, 4),
(2, 'Vivek', 'Sector 21', 9823464728 , 2, 5),
(3, 'Aalim', 'Sector 31', 9234534343 , 4, 3),
(4, 'Parth', 'Sector 92', 9234564738 , 1, 1),
(5, 'Dishad', 'Sector 72', 9823433457 , 2, 4)

insert into Branches(bran_no, bran_name, region, phone, no_of_employees, manager_no, manager, bran_expenditure, tot_revenue)
values(1, 'MOI', 'Noida', 0120424446, 30, 6, 'Ramesh', 150000, 175000),
(2, 'GIP', 'Noida', 0120424886, 25, 9, 'Mahesh', 175000, 180000),
(3, 'Hudco', 'Delhi', 0112342444, 40, 15, 'Siddharth', 200000, 250000),
(4, 'CP', 'Delhi', 0112356246, 30, 17, 'Sachin', 75000, 90000),
(5, 'Cyber City', 'Gurgaon', 0127728767, 20, 21, 'Aman', 40000, 50000)
 
insert into Employees(bn1, dn1, emp_no, emp_name, emp_address, emp_email, emp_salary, emp_phone, gender, recruit_date)
values(1,2,6,'Ramesh', 'Sector 21', 'Ramesh@gmail.com', 15000, 9263748576, 'Male', '2013-10-10'),
(2,2,9,'Mahesh', 'Sector 29', 'Mahesh@gmail.com', 15000, 8738394837, 'Male', '2013-12-10'),
(3,1,15,'Siddharth', 'Sector 98', 'Siddharth@gmail.com', 15000, 7786273756, 'Male', '2012-1-10'),
(4,1,17,'Sachin', 'Sector 45', 'Sachin@gmail.com', 15000, 5465675676, 'Male', '2014-5-1'),
(5,3,21,'Aman', 'Sector 8', 'Aman@gmail.com', 15000, 9834456786, 'Male', '2015-12-1')

insert into Orders(od, dlno, cno, brno, ord_no, ord_type, extra_ingredients, tot_price)
values(1, 1, 1, 1, 1, 'dine-in', 'none', 2000),
(2, 1, 2, 2, 2, 'dine-in', 'cheese', 3000),
(3, 2, 3, 3, 3, 'take-away', 'none', 400),
(4, 3, 4, 4, 4, 'take-away', 'olives', 2500),
(5, 5, 5, 5, 5, 'dine-in', 'none', 2000)


insert into Employee_Work_Hrs(enum, emp_date, in_time, out_time)
values(6,'2018-01-01', '09:00:00', '17:00:00'),
(9,'2018-01-02', '09:00:00', '17:00:00'),
(15,'2018-01-01', '17:00:00', '01:00:00'),
(17,'2018-01-02', '17:00:00', '01:00:00'),
(21,'2018-01-01', '09:00:00', '17:00:00')

insert into Food_Items(item_no,	item_name, veg_non, spicy_non, price, item_type)
values(1, 'Margherita', 'Veg', 'Non Spicy', 320, 'Pizza'),
(2, 'Veg Delight', 'Veg', 'Non Spicy', 350, 'Pizza'),
(3, 'Chicken Delight', 'Non Veg', 'Non Spicy', 420, 'Pizza'),
(4, 'Spicy Chicken', 'Non Veg', 'Spicy', 480, 'Pizza'),
(5, 'Garlic Bread', 'Veg', 'Non Spicy', 100, 'Sides'),
(6, 'Taco', 'Non Veg', 'Spicy', 140, 'Sides')

insert into Ingredients(ingr_no, ingr_name, ingr_type, price)
values(1, 'Pizza Base', 'Veg', 40),
(2, 'Cheese', 'Veg', 80),
(3, 'Mushrooms', 'Veg', 120),
(4, 'Chicken', 'Non Veg', 220),
(5, 'Onions', 'Veg', 60)

insert into Inventory(ingrno,inven_no, qty_rqd, qty_present, price)
values(1, 1, 30, 25, 1200),
(2, 2, 40, 40,3200),
(3, 3, 20, 5, 2400),
(4, 4, 50, 25, 11000),
(5, 5, 5, 5, 300)

insert into Deliveries(dl, bn2, empno, transport)
values(1, 1, 6, 'Bike'),
(2, 2, 9, 'Bike'),
(3, 3, 15, 'Bike'),
(4, 1, 17, 'Bike'),
(5, 1, 21, 'Bike')

insert into Deals(deal_no, itemno, deal_name, deal_descrip, discounted_price)
values(1, 1, 'Christmas Special', 'Medium free with two mediums', 600),
(2, 1, 'Diwali Special', 'Garlic bread free with a large pizza', 400),
(3, 2, 'Thursday Treat', 'Small free with two mediums', 500),
(4, 2, 'Tango Twist', 'Mocktail free with two Mocktails', 300),
(5, 3, 'Happy Pizza', 'Large free for orders over 3000', 600)

insert into Logistics(invno, ingrno, invenno, log_no, log_name, log_type)
values(1, 1, 1, 1, 'A', 'a'),
(2, 2, 2, 2, 'B', 'b'),
(3, 3, 3, 3, 'C', 'b'),
(4, 4, 4, 4, 'D', 'a'),
(5, 5, 5, 5, 'E', 'c')

insert into Finance(inv_no, ordno, logno, tran_no, inflow, outflow, balance)
values(1, 1, 1, 1, 0, 200, 200000),
(2, 2, 2, 2, 0, 300, 199700),
(3, 3, 3, 3, 500, 0, 200200),
(4, 4, 4, 4, 800, 0, 201000),
(5, 5, 5, 5, 0, 200, 200800)

insert into Complaints(bno3, cnum, comp_no, category, comp_descrip, comp_status)
values(1, 1, 1, 'Food', 'Food was cold', 'Flagged'),
(2, 2, 2, 'Cleanliness', 'Washrooms were very dirty', 'Resolved'),
(3, 3, 3, 'Food', 'Food was cold', 'Flagged'),
(4, 4, 4, 'Employee', 'Employee was shouting', 'Due'),
(5, 5, 5, 'Cleanliness', 'Hair on pizza', 'Resolved')

insert into have(dn, bn)
values(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5)

insert into requires(bnum, lognum)
values(1, 1),
(2, 2),
(3, 3),
(3, 4),
(5, 5)

insert into compriseof(ono, ino)
values(4, 1),
(2, 2),
(2, 3),
(4, 4),
(3, 5)

insert into req(inno, fino)
values(1, 1),
(3, 2),
(3, 3),
(1, 4),
(2, 3)

insert into deptt_delivery (dd)
values(1),(2),(3),(4),(5)

insert into deptt_kitchen(dk)
values(1),(2),(3),(4),(5)

insert into deptt_orders(do)
values(1),(2),(3),(4),(5)
---------------------------
select hod from Department

select * from req

select item_name, fino from Food_Items, req
where item_no = (select fino from req group by fino having count(inno)>1)

select item_name from Food_Items,req where Food_Items.item_no=req.fino and inno>2

select item_no from Food_Items, compriseof where Food_Items.item_no=compriseof.ino
select ord_no from Orders, compriseof where Orders.od=compriseof.ono and extra_ingredients='none'


--(1)
select cust_name from Customer, Orders where Customer.cust_no = Orders.cno and ord_no in 
(select distinct ord_no from Orders, Food_Items where extra_ingredients='none' and spicy_non = 'Non Spicy')

--(2)
Update Orders set tot_price = (0.6*tot_price) where tot_price in(
select tot_price from Orders, Customer where Customer.cust_no = Orders.cno and cust_no in 
(select cust_no from Customer, Complaints where Customer.Cust_no = Complaints.cnum and comp_descrip = 'Food was cold'))
select * from orders

 

delete from deptt_orders
delete from deptt_kitchen
delete from deptt_delivery
delete from req
delete from compriseof
delete from requires
delete from have
delete from Complaints
delete from Finance
delete from Logistics
delete from Deals
delete from Deliveries
delete from Inventory
delete from Ingredients
delete from Food_Items
delete from Employee_Work_Hrs
delete from Orders
delete from Employees
delete from Branches
delete from Customer
delete from Department

drop table deptt_orders
drop table deptt_kitchen
drop table deptt_delivery
drop table req
drop table compriseof
drop table requires
drop table have
drop table Complaints
drop table Finance
drop table Logistics
drop table Deals
drop table Deliveries
drop table Inventory
drop table Ingredients
drop table Food_Items
drop table Employee_Work_Hrs
drop table Orders
drop table Employees
drop table Branches
drop table Customer
drop table Department

drop database Pizza_And_Chill
