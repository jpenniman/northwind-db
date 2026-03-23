# SQLite

The original script is a bit large, and editors and AI tools have trouble with it. So, the initial script is broken up
into two scripts: schema, data.

| Script                            | Description                                                                                                |
|-----------------------------------|------------------------------------------------------------------------------------------------------------|
| `northwind-sqlite.sql`            | A direct port of the instnwnd.sql to sqlite                                                                |
| `northwind-mud-schema-sqlite.sql` | A varient that is a bit more friendly but still beholding to the original model. Contains the schema only. |
| `northwind-mud-data-sqlite.sql`   | A script to populate the mud schema above with data.                                                       |

