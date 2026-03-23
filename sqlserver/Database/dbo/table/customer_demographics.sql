-- filepath: /home/jason/dev/training/NorthwindDatabase/src/Database/sales/table/customer_demographics.sql
CREATE TABLE dbo.CustomerDemographics (
    "CustomerTypeID" nchar(10) NOT NULL,
    "CustomerDesc" ntext NULL,
    CONSTRAINT "PK_CustomerDemographics" PRIMARY KEY CLUSTERED 
    (
        "CustomerTypeID" ASC
    )
)
GO