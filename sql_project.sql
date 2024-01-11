--''' find the persons whose last 
--name starts with letter 'L'. Return BusinessEntityID, FirstName, LastName 
--'''

select 
BusinessEntityID,  LastName, FirstName
from
Person.Person
where LastName like '%L'
order by LastName, FirstName

--'''  find the sum of subtotal column. 
--Group the sum on distinct salespersonid and customerid. Rolls up the results into 
--subtotal and running total. Return salespersonid, customerid and sum of subtotal 
--column i.e. sum_subtotal. '''

select
CustomerID, SalesPersonID, sum(subtotal) as Sum_subtotal
from
Sales.SalesOrderHeader
group by SalesPersonID, CustomerID

--'''  find the sum of the quantity of 
--all combination of group of distinct locationid and shelf column. Return 
--locationid, shelf and sum of quantity as TotalQuantity.'''

select 
locationid, shelf, sum(quantity) as TotalQuantity
from
Production.ProductInventory
group by LocationID, Shelf

--'''  find the sum of the quantity with 
--subtotal for each locationid. Group the results for all combination of distinct 
--locationid and shelf column. Rolls up the results into subtotal and running total. 
--Return locationid, shelf and sum of quantity as TotalQuantity '''

select locationid, shelf, sum(quantity)  as TotalQuantity
from
Production.ProductInventory
group by LocationID, Shelf

-- find the total quantity for each 
--locationid and calculate the grand-total for all locations. Return locationid and 
--total quantity. Group the results on locationid.

select locationid, sum(quantity), sum(LocationID)
from
Production.ProductInventory
group by LocationID

---- retrieve the total sales for each 
----year. Filter the result set for those orders where order year is on or before 2016. 
----Return the year part of orderdate and total due amount. Sort the result in ascending 
----order on year part of order date.

select
YEAR(OrderDate) as OrderDate, (TotalDue)
from
Sales.SalesOrderHeader
group by YEAR(OrderDate), TotalDue
having YEAR(OrderDate) <= 2016
order by YEAR(OrderDate) asc

--  find the contacts who are 
--designated as a manager in various departments. Returns ContactTypeID, name. 
--Sort the result set in descending order.

select
ContactTypeID, Name
from
Person.ContactType
where name like '%manager%'

select 
* 
from
HumanResources.Employee
where JobTitle like '%Purchasing Manager'

-- make a list of contacts who are 
--designated as 'Purchasing Manager'. Return BusinessEntityID, LastName, and 
--FirstName columns. Sort the result set in ascending order of LastName, and 
--FirstName.

select 
p.BusinessEntityID , LastName, FirstName
from
Person.Person as p join HumanResources.Employee as e on p.BusinessEntityID = e.BusinessEntityID
where JobTitle like '%Purchasing Manager'



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
