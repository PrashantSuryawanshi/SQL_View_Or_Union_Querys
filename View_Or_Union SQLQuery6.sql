-----  View's in SQL  -------

create table paintings_ForView
(
paintingid int primary key,
name varchar(10),
artistId int,
price decimal
)

insert into paintings_ForView values(11,'miracle',1,300),
                            (12,'Barbie',1,700),
                            (13,'Sunshine',2,2800),
                            (14,'Mountain',2,2300),
                            (15,'cool',3,250),
                            (16,'Bright',3,5000),
                            (17,'miracle',3,50),
                            (18,'Sunshine',4,1300);

select*from paintings_ForView 

create table artists_ForView
(
artistId int,
name varchar(20),
)

insert into artists_ForView values(1,'Rahul'),
(2,'Kishor'),
(3,'Amol'),
(4,'Prashant');

create table collectors_ForView
(
collectorid int,
name varchar(20),
)

insert into collectors_ForView values(101,'Pooja'),
(102,'Nikita'),
(103,'Sonali'),
(104,'Nikhil');

create table sales_ForView
(
id int,
saledate varchar(20),
paintingid int,
artistId int,
collectorid int,
salesprice decimal
)

insert into sales_ForView values(1001,'2022-4-17',13,2,104,2500),
                                (1002,'2022-3-16',14,2,102,2300),
                                (1003,'2022-5-13',11,1,102,300),
                                (1004,'2022-6-15',16,3,103,4000),
                                (1005,'2022-5-14',15,3,103,200),
                                (1005,'2022-4-21',17,3,103,50);

create view DisplayDetails
as
select c.name,s.salesprice
from collectors c
inner join sales s on s.collectorid=c.collectorid
inner join paintings p on p.paintingid=s.paintingid

select*from DisplayDetails

create view details
as
select * from sales_ForView where salesprice>300

select*from details

---------------------------------------------------------------

---------  UNION & UNION ALL  -----------

create table Customer_Table
(
city varchar(20),
state varchar(30)
)
select*from Customer_Table

delete from Customer_Table where city in('Patna')

insert into Customer_Table values('Pune','Maharasta'),
                                 ('Bhopal','MP'),
								 ('Mumbai','Maharatra'),
								 ('Patna','Bihar'),
								 ('Chandigarh','Haryana');

create table supplier
(
city varchar(20),
state varchar(30)
)

select*from supplier

insert into supplier values('Nashik','Maharasta'),
                           ('Indore','MP'),
					       ('Mumbai','Maharatra'),
						   ('Patna','Bihar'),
						   ('Gurgaon','Haryana');
insert into supplier values('Dispur','Assam')

--Union- unique data from both tables

Select city,state from Customer_Table
Union
Select city, state from supplier
Order by city 


--Union all - allow duplicate records

Select city,state from Customer_Table
Union ALL
Select city, state from supplier
Order by city 

