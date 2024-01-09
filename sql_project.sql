''' From the following table write a query in SQL to retrieve all rows and columns from the 
employee table in the Adventureworks database. Sort the result set in ascending order on 
jobtitle.
'''
select 
* 
from 
HumanResources.Employee
order by JobTitle asc

''' From the following table Person.Person
write a query in SQL to retrieve all rows and columns from the 
employee table using table aliasing in the Adventureworks database. Sort the output in 
ascending order on lastname.''' 
  
select 
FirstName, LastName,BusinessEntityID as Employee_id
from 
Person.Person
order by LastName asc

select
* 
from
Person.Person

select ProductID, ProductNumber, Name from 
[Production].[Product]
where SellStartDate is not null and ProductLine = 'T'
order by Name

''' percentage returned '''

select 
SalesOrderID, CustomerID, OrderDate,SubTotal,TaxAmt / 100 as "percentage of tax"
from 
Sales.SalesOrderHeader
order by SubTotal

select 
distinct JobTitle
from
HumanResources.Employee

select
CustomerID, sum(freight) as "Total Freight"
from 
Sales.SalesOrderHeader
group by CustomerID
order by CustomerID

select CustomerID, Freight from Sales.SalesOrderHeader
where CustomerID = 11000


select 
CustomerID, AVG(subtotal) as Average, sum(subtotal) as Sum
from
Sales.SalesOrderHeader
group by CustomerID, SalesPersonID
order by CustomerID desc

select 
ProductID, sum(quantity) as Sum_quantity
from
Production.ProductInventory
where Shelf in ('A', 'C', 'H') 
group by ProductID 
having sum(quantity) > 500
order by ProductID

select
sum(locationid) * 10 as Total_Quantity
from
Production.ProductInventory
group by LocationID
