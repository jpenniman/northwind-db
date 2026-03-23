create view "Order Details Extended" AS
SELECT [dbo].[Order Details].OrderID, [dbo].[Order Details].ProductID, [dbo].Products.ProductName, 
	[dbo].[Order Details].UnitPrice, [dbo].[Order Details].Quantity, [dbo].[Order Details].Discount, 
	(CONVERT(money,([dbo].[Order Details].UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice
FROM [dbo].Products INNER JOIN [dbo].[Order Details] ON [dbo].Products.ProductID = [dbo].[Order Details].ProductID
--ORDER BY "Order Details".OrderID