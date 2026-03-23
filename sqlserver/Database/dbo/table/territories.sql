-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/territories.sql
CREATE TABLE dbo.Territories (
    "TerritoryID" nvarchar(20) NOT NULL,
    "TerritoryDescription" nchar(50) NOT NULL,
    "RegionID" int NOT NULL,
    CONSTRAINT "PK_Territories" PRIMARY KEY CLUSTERED 
    (
        "TerritoryID" ASC
    ),
    CONSTRAINT "FK_Territories_Region" FOREIGN KEY("RegionID")
        REFERENCES dbo.Region ("RegionID")
)
GO