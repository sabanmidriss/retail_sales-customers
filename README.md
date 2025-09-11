# Retail Sales & Customers — SQL Analytics

This project showcases SQL data loading and analytics in PostgreSQL using pgAdmin 4. It includes schema creation, a safe load pipeline via a staging table, and a few analysis queries (total revenue, best category, top malls, gender x category).

## Files
- **`sql/tables.sql`** – creates schemas `retail`, `staging` and the tables `customers`, `sales`, plus the raw staging table.
- **`sql/data.sql`** – transforms and loads sales from the staging table into `retail.sales`, parsing the DD‑MM‑YYYY date and casting price.
- **`sql/retail_sales.sql`** – analysis queries you can run in pgAdmin:
  - Total revenue.
  - Most popular category by revenue. 
  - Top 3 malls by revenue.
  - Gender distribution per category (two variants). 
## How to run 

Create objects: run sql/tables.sql to create schemas/tables.


-	Import customer_data.csv into retail.customers (CSV, Header ✓).
-	Import sales_data.csv into staging.staging_sales_raw (CSV, Header ✓).
-	Transform to final: run sql/data.sql to insert into retail.sales (date parsing + numeric cast).
-	Run analytics: execute queries from sql/retail_sales.sql one by one.
-	(Optional) Export results: save query outputs into a /results folder for your repo.

## Example questions covered
- What is the total revenue? (sum of `quantity*price`)   
- Which category generates the most sales revenue? 
- Which 3 malls lead by revenue? 
- How does gender distribute across categories? 
