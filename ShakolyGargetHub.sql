/* 1. Create an OLTP system for retails business that
manages products, customers, orders and inventory 

2. This system will capture transactional data and serve
as the foundation for reporting and analysis 

Database Structure:
	We'll create four main tables to represent the entities:

	Products: Stores information about the products sold by the retail store.
	Customers: Stores customer information.
	Orders: Tracks each customer’s orders.
	Inventory: Keeps track of stock levels for each product.

ER Diagram:
	Before we begin creating the database, let's look at the relationships between the entities:

	Customers can place multiple Orders.
	Each Order contains one or more Products.
	The Inventory keeps track of product stock levels.
*/

--- Create the database

create database ShakorlyGadgetStore

use ShakorlyGadgetStore

--- create Customer Table
create table Customers (
	CustomerID int not null Primary key identity(1,1),
	FistName varchar(50),
	LastName varchar(50),
	Email varchar(100),
	Phone varchar(20)
)

--- Create Product Table

create table Products (
	ProductId int not null identity(1,1) primary key,
	ProductName varchar(100),
	Category varchar(50),
	Price Decimal(10, 2),
	QuantityInStock int
)

--- Create the Orders Table
Create Table Orders (
	OrderId int primary key identity(1,1),
	CustomerId int,
	orderDate date,
	TotalAmount decimal(10,2),
	foreign key (CustomerId) references customers(CustomerID)
)

---  Create the OrderDetails Table

create table OrderDetails (
	OrderDetailId int primary key not null identity(1,1),
	OrderId int,
	ProductId int,
	Quantity int,
	Price decimal(10,1),
	foreign key (OrderId) references Orders(OrderId),
	foreign key (ProductId) references Products(ProductId),
)

-- create the inventory table

create table Inventory (
	InventoryId int primary key not null identity(1,1),
	ProductId int,
	QuantityInStock int,
	foreign key(ProductId) references Products(ProductId)
)

--- Insert into tables ---
insert into Customers (FistName, LastName, Email, Phone)
values  ('Wakeel', 'Trusttech', 'wakeeltrusttech@gmail.com', '123-456-789'),
		('Yusuf', 'Coperate', 'yusufcoperate@gmail.com', '123-456-780'),
		('Ridwon', 'Hustler', 'ridwonhustler@gmail.com', '123-456-781'),
		('Mukaram', 'Nepa', 'mukaramnepa@gmail.com', '123-456-782'),
		('John', 'Doe', 'johndoe@example.com', '123-456-7890'),
        ('Jane', 'Smith', 'janesmith@example.com', '987-654-3210')


insert into Products (ProductName, Category, Price, QuantityInStock)
VALUES
	('Laptop', 'Electronics', 800.00, 50),
	('Smartphone', 'Electronics', 600.00, 100),
	('Headphones', 'Accessories', 50.00, 200),
	('pos', 'Electronics', 800.00, 50),
	('Toyota', 'Automobile', 600.00, 100),
	('charger', 'Accessories', 50.00, 200);


insert into Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2024-09-10', 1500.00),
(2, '2023-11-12', 90.00),
(3, '2024-10-10', 1400.00),
(4, '2024-09-09', 500.00),
(5, '2024-08-10', 1800.00),
(2, '2024-08-10', 100.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 8.00),
(1, 2, 3, 6.00),
(2, 4, 1, 5.00),
(3, 1, 2, 8.00),
(4, 5, 1, 6.00),
(3, 3, 5, 5.00);

alter table OrderDetails
alter column price decimal(10,2)


INSERT INTO Inventory (ProductID, QuantityInStock)
VALUES
(1, 500),
(2, 100),
(3, 300),
(1, 250),
(2, 500),
(3, 280);


--- Testing the OLTP

select * from Customers
select * from Inventory
select * from OrderDetails
select * from Orders
select * from Products

--- View detailed order information

select Orders.OrderId, Customers.FistName, Customers.LastName, Products.ProductName, OrderDetails.Quantity, OrderDetails.Price
from OrderDetails
join Orders on OrderDetails.OrderId = Orders.OrderId
join Customers on Orders.CustomerId = Customers.CustomerID
join Products on OrderDetails.ProductId = Products.ProductId