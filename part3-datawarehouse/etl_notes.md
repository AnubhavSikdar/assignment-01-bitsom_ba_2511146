# ETL Decisions

## Decision 1 — Standardizing Date Format

Problem: The raw dataset contained multiple date formats such as DD-MM-YYYY and YYYY/MM/DD which created inconsistencies when loading data.

Resolution: All dates were converted to the standard YYYY-MM-DD format before inserting them into the dim_date table.

## Decision 2 — Handling NULL Store Names

Problem: Some rows contained NULL or missing store values which could break foreign key relationships.

Resolution: Missing store values were replaced with a placeholder value such as 'Unknown Store' to maintain referential integrity.

## Decision 3 — Standardizing Category Case

Problem: Product categories appeared with inconsistent casing such as 'electronics', 'Electronics', and 'ELECTRONICS'.

Resolution: All category values were standardized to title case (e.g., 'Electronics') before loading them into the dim_product table.