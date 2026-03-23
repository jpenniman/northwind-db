-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/region.sql
CREATE TABLE dbo.Region (
    "RegionID" int NOT NULL,
    "RegionDescription" nchar(50) NOT NULL,
    CONSTRAINT "PK_Region" PRIMARY KEY CLUSTERED 
    (
        "RegionID" ASC
    )
)
GO