--Question 1

select * 
from Customers, Orders, Suppliers;

--Question 2
select ContactName
from Customers
where ContactTitle LIKE '%manager'
order by ContactName asc

--Question 3
select *
from Orders
where OrderDate ='19 May 1997'

--Question 4
select CompanyName,Fax,Phone,Country,Homepage
from Suppliers
order by Country Desc,CompanyName Asc

--Question 5
select 
ProductName,UnitPrice,QuantityPerUnit
from Products
where UnitsInStock=0

--Question6
select 
ContactName,Address,City,Country
from Customers
where country not in('Germany','Mexico','Spain')

--Question 7
select 
AVG(UnitPrice) as 'AveragePrice',
Min(UnitPrice) as 'MinimumPrice',
Max(UnitPrice) as 'MaximumPrice'
from Products

--Question 8
select 
FirstName,Lastname
from employees
where ReportsTo is NULL

--Question 9
select
ShipPostalCode,OrderID,OrderDate,RequiredDate,ShippedDate,ShipAddress
from Orders
where ShipPostalCode like '98124%'

--Question 10
select
LastName,FirstName,City
from Employees
where City !='Seattle'

--Question 11
select 
ContactName,ContactTitle,CompanyName
from Customers
where ContactTitle not Like 'Sales%'

--Question 12
select
CustomerID,
SUM(Freight) As SumofFreight
from Orders
group by CustomerID
having sum(Freight)>200

--Question 13
select 
Suppliers.SupplierID,
Suppliers.CompanyName,
Categories.CategoryName,
Products.ProductName,
Products.Unitprice

from
Products
Inner join Suppliers
on Products.SupplierID=Suppliers.SupplierID
Inner join Categories
on Products.CategoryID=Categories.CategoryID

--Question 14
select 
Orders.OrderID,
Employees.FirstName,
Employees.LastName

from
Orders 
Inner join Employees
on Orders.EmployeeID= Employees.EmployeeID
where Orders.ShippedDate> Orders.RequiredDate

--Question 15
select 
productID,
SUM(Quantity) as 'Total Quantity of products'
from [Order Details]
group by ProductID
having Sum(Quantity)<200

--Question 16
select
CustomerID,
Count(OrderID) As 'Total number of Orders'
from Orders
where OrderDate>1996-12-31
group by CustomerID
having Count(OrderID)>15

--Question 17
select 
p.ProductName,
p.UnitPrice,
s.CompanyName
from Products p
inner join Suppliers s
on p.SupplierID =s.SupplierID

--Question 18
select 
p.ProductName,
Sum(o.UnitPrice*o.Quantity*(1-o.Discount))
as 'Total costs'

from Products p

inner join [Order Details] o
on p.ProductID=o.ProductID

group by p.ProductName

Having sum(o.UnitPrice*o.Quantity*(1-o.Discount))>200

--Question 19
select
    OrderID,
    count(OrderID) as NumberOfOrders
from [Order Details]
group by OrderID
order by NumberOfOrders desc;

--Question 20
select
    s.SupplierID,
    p.ProductName,
    s.CompanyName
from Products p
inner join Suppliers s
    on p.SupplierID = s.SupplierID
where s.CompanyName in (
    'Exotic Liquids',
    'Specialty Biscuits, Ltd.',
    'Escargots Nouveaux'
)
order by s.SupplierID;