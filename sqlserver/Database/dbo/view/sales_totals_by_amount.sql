create view "Sales Totals by Amount" AS
SELECT [dbo].[Order Subtotals].Subtotal AS SaleAmount, [dbo].Orders.OrderID, 
    [dbo].Customers.CompanyName, [dbo].Orders.ShippedDate
FROM [dbo].Customers INNER JOIN 
    ([dbo].Orders INNER JOIN [dbo].[Order Subtotals] ON [dbo].Orders.OrderID = [dbo].[Order Subtotals].OrderID) 
    ON [dbo].Customers.CustomerID = [dbo].Orders.CustomerID
WHERE ([dbo].[Order Subtotals].Subtotal > 2500) AND ([dbo].Orders.ShippedDate BETWEEN '19970101' And '19971231')