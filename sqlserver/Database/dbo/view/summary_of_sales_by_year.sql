create view "Summary of Sales by Year" AS
SELECT [dbo].Orders.ShippedDate, [dbo].Orders.OrderID, [dbo].[Order Subtotals].Subtotal
FROM [dbo].Orders INNER JOIN [dbo].[Order Subtotals] ON [dbo].Orders.OrderID = [dbo].[Order Subtotals].OrderID
WHERE [dbo].Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate