create view "Product Sales for 1997" AS
SELECT Categories.CategoryName, Products.ProductName, 
Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM [dbo].Categories INNER JOIN 
	([dbo].Products INNER JOIN 
		([dbo].Orders INNER JOIN [dbo].[Order Details] ON [dbo].Orders.OrderID = [dbo].[Order Details].OrderID) 
	ON [dbo].Products.ProductID = [dbo].[Order Details].ProductID) 
ON [dbo].Categories.CategoryID = [dbo].Products.CategoryID
WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
GROUP BY Categories.CategoryName, Products.ProductName