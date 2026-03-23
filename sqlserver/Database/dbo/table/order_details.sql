create table [dbo].[Order Details]
(
    OrderID int NOT NULL,
    ProductID int NOT NULL,
    UnitPrice money NOT NULL DEFAULT (0),
    Quantity smallint NOT NULL DEFAULT (1),
    Discount real NOT NULL DEFAULT (0),
    CONSTRAINT PK_Order_Details PRIMARY KEY CLUSTERED (OrderID, ProductID),
    CONSTRAINT [CK_UnitPrice] CHECK (UnitPrice >= 0),
    CONSTRAINT [CK_Quantity] CHECK (Quantity > 0),
    CONSTRAINT [CK_Discount] CHECK (Discount >= 0 and Discount <= 1)
);
GO

-- Create indexes
CREATE INDEX [OrderID] ON [dbo].[Order Details]([OrderID]);
GO
CREATE INDEX [OrdersOrder_Details] ON [dbo].[Order Details]([OrderID]);
GO
CREATE INDEX [ProductID] ON [dbo].[Order Details]([ProductID]);
GO
CREATE INDEX [ProductsOrder_Details] ON [dbo].[Order Details]([ProductID]);
GO
