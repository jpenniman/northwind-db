# Northwind Sample Database

I like using the Northwind sample database from Microsoft for demos and training. The schema is small enough that it is
easy to reason over, yet includes a bit of everything.

In addition to the original schema, I also provide a few variations to support good architecture, microservices, and
scripts to create AspNet Core Identity users for each of the employees in the database.

The original sample from Microsoft is for SQL Server. I have ported the original and my variants to PostgreSQL, MySQL,
and SQLite.

## Images

The original database includes images for employee photos and categories are stored in the database itself and embedded 
in the scripts as part of the insert statements. While the original scripts remains intact, I supply a variation with
the original schema but with the images applied as updates later from modern enhanced png versions of the originals. My
variations also use `varbinary(max)` instead of `image` for the SQL Server column type.

