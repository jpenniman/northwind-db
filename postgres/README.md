# PostgreSQL

The original script is a bit large, and editors and AI tools have trouble with it. So, the initial script is broken up
into three scripts: schema, data, post-script.

| Script                                        | Description                                                                                                        |
|-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| `northwind-postgres.sql`                      | A direct port of the instnwnd.sql to pgsql                                                                         |
| `northwind-mud-schema-postgres.sql`           | A varient that is a bit more Postges friendly but still beholding to the original model. Contains the schema only. |
| `northwind-mud-data-postgres.sql`             | A script to populate the mud schema above with data.                                                               |
| `northwind-mud-schema-postscipt-postgres.sql` | A script that applies the foreign key constraints and resets the sequences.                                        |

