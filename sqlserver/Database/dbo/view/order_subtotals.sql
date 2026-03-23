create view "Order Subtotals" AS
SELECT [dbo]."Order Details".OrderID, Sum(CONVERT(money,([dbo]."Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM [dbo]."Order Details"
GROUP BY [dbo]."Order Details".OrderID