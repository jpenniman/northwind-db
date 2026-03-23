create view "Products Above Average Price" AS
SELECT [dbo].Products.ProductName, [dbo].Products.UnitPrice
FROM [dbo].Products
WHERE [dbo].Products.UnitPrice > (SELECT AVG(UnitPrice) From [dbo].Products)
--ORDER BY Products.UnitPrice DESC