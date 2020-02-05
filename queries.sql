-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName as [prod], c.CategoryName as [cat]
FROM product as p
JOIN category as c
ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, c.CompanyName
FROM [order] as o
JOIN Customer as c
ON o.CustomerId = c.Id
WHERE o.orderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.Quantity
FROM OrderDetail as o
JOIN Product as p
ON o.OrderId = '10251' AND o.ProductId = p.id
ORDER BY p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [order].Id as 'Order ID', Customer.CompanyName as 'Company Name', Employee.LastName as 'Employee Last Name'
FROM [order]
JOIN Customer
JOIN Employee
WHERE [order].EmployeeId = Employee.Id AND [order].CustomerId = Customer.Id

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
select c.CategoryName as category, count(p.productName)
from product as p
join category as c
on p.categoryid = c.id
group by c.categoryname
order by c.categoryname