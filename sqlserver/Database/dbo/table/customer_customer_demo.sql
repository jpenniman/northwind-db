-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/customer_customer_demo.sql
CREATE TABLE dbo.CustomerCustomerDemo (
    "CustomerID" nchar(5) NOT NULL,
    "CustomerTypeID" nchar(10) NOT NULL,
    CONSTRAINT "PK_CustomerCustomerDemo" PRIMARY KEY CLUSTERED 
    (
        "CustomerID" ASC,
        "CustomerTypeID" ASC
    ),
    CONSTRAINT "FK_CustomerCustomerDemo_Customers" FOREIGN KEY("CustomerID")
        REFERENCES dbo.Customers ("CustomerID"),
    CONSTRAINT "FK_CustomerCustomerDemo_CustomerDemographics" FOREIGN KEY("CustomerTypeID")
        REFERENCES dbo.CustomerDemographics ("CustomerTypeID")
)
GO