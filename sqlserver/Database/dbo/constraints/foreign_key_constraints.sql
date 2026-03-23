-- Foreign key constraints from Northwind database
ALTER TABLE [dbo].[Order Details]
ADD CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID]);
GO

ALTER TABLE [dbo].[Order Details]
ADD CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID]);
GO

-- ALTER TABLE [dbo].[Orders]
-- ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
-- REFERENCES [dbo].[Customers] ([CustomerID]);
-- GO

-- ALTER TABLE [dbo].[Orders]
-- ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
-- REFERENCES [dbo].[Employees] ([EmployeeID]);
-- GO

-- ALTER TABLE [dbo].[Orders]
-- ADD CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
-- REFERENCES [shipping].[Shippers] ([ShipperID]);
-- GO

-- ALTER TABLE [dbo].[Products]
-- ADD CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
-- REFERENCES [dbo].[Categories] ([CategoryID]);
-- GO

-- ALTER TABLE [dbo].[Products]
-- ADD CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
-- REFERENCES [dbo].[Suppliers] ([SupplierID]);
-- GO

ALTER TABLE [dbo].[EmployeeTerritories]
ADD CONSTRAINT [FK_Employee_Territories_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID]);
GO

ALTER TABLE [dbo].[EmployeeTerritories]
ADD CONSTRAINT [FK_Employee_Territories_Territories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID]);
GO

-- ALTER TABLE [dbo].[Territories]
-- ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
-- REFERENCES [dbo].[Region] ([RegionID]);
-- GO

ALTER TABLE [dbo].[CustomerCustomerDemo]
ADD CONSTRAINT [FK_Customer_Customer_Demo_Customer_Demographics] FOREIGN KEY([CustomerTypeID])
REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID]);
GO

ALTER TABLE [dbo].[CustomerCustomerDemo]
ADD CONSTRAINT [FK_Customer_Customer_Demo_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID]);
GO
