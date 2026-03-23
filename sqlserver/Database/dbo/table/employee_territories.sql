-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/employee_territories.sql
CREATE TABLE dbo.EmployeeTerritories (
    "EmployeeID" int NOT NULL,
    "TerritoryID" nvarchar(20) NOT NULL,
    CONSTRAINT "PK_EmployeeTerritories" PRIMARY KEY CLUSTERED 
    (
        "EmployeeID" ASC,
        "TerritoryID" ASC
    ),
    CONSTRAINT "FK_EmployeeTerritories_Territories" FOREIGN KEY("TerritoryID")
        REFERENCES dbo.Territories ("TerritoryID")
)
GO