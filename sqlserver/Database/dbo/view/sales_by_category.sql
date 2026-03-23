create view "Sales by Category" AS
SELECT [dbo].Categories.CategoryID, [dbo].Categories.CategoryName, [dbo].Products.ProductName, 
	Sum([dbo].[Order Details Extended].ExtendedPrice) AS ProductSales
FROM [dbo].Categories INNER JOIN 
	([dbo].Products INNER JOIN 
		([dbo].Orders INNER JOIN [dbo].[Order Details Extended] ON [dbo].Orders.OrderID = [dbo].[Order Details Extended].OrderID) 
	ON [dbo].Products.ProductID = [dbo].[Order Details Extended].ProductID) 
ON [dbo].Categories.CategoryID = [dbo].Products.CategoryID
GROUP BY [dbo].Categories.CategoryID, [dbo].Categories.CategoryName, [dbo].Products.ProductName