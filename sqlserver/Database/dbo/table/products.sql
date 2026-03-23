create table dbo.Products
(
    ProductID int IDENTITY (1, 1) NOT NULL,
    ProductName nvarchar (40) NOT NULL,
    SupplierID int NULL,
    CategoryID int NULL,
    QuantityPerUnit nvarchar (20) NULL,
    UnitPrice money NULL DEFAULT (0),
    UnitsInStock smallint NULL DEFAULT (0),
    UnitsOnOrder smallint NULL DEFAULT (0),
    ReorderLevel smallint NULL DEFAULT (0),
    Discontinued bit NOT NULL DEFAULT (0),
    CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID),
    CONSTRAINT [CK_ReorderLevel] CHECK (ReorderLevel >= 0),
    CONSTRAINT [CK_UnitsOnOrder] CHECK (UnitsOnOrder >= 0),
    CONSTRAINT [CK_UnitsInStock] CHECK (UnitsInStock >= 0),
    CONSTRAINT [CK_Products_UnitPrice] CHECK (UnitPrice >= 0),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]),
    CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
);
GO

-- Create indexes
CREATE INDEX [CategoriesProducts] ON [dbo].[Products]([CategoryID]);
GO
CREATE INDEX [CategoryID] ON [dbo].[Products]([CategoryID]);
GO
CREATE INDEX [ProductName] ON [dbo].[Products]([ProductName]);
GO
CREATE INDEX [SupplierID] ON [dbo].[Products]([SupplierID]);
GO
CREATE INDEX [SuppliersProducts] ON [dbo].[Products]([SupplierID]);
GO
