-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/categories.sql
CREATE TABLE [dbo].[Categories] (
    [CategoryID] [int] IDENTITY (1, 1) NOT NULL,
    [CategoryName] [nvarchar](15) NOT NULL,
    [Description] [ntext] NULL,
    [Picture] [image] NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
)
GO

CREATE INDEX [CategoryName] ON [dbo].[Categories]([CategoryName])
GO