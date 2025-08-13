# Retail Sales & Customers — SQL Analytics (PostgreSQL / pgAdmin 4)

This project showcases SQL data loading and analytics in PostgreSQL using pgAdmin 4. It includes schema creation, a safe load pipeline via a staging table, and a few analysis queries (total revenue, best category, top malls, gender x category).

## Files
- **`sql/tables.sql`** – creates schemas `retail`, `staging` and the tables `customers`, `sales`, plus the raw staging table.
- **`sql/data.sql`** – transforms and loads sales from the staging table into `retail.sales`, parsing the DD‑MM‑YYYY date and casting price.
- **`sql/retail_sales.sql`** – analysis queries you can run in pgAdmin:
  - Total revenue.
  - Most popular category by revenue. 
  - Top 3 malls by revenue.
  - Gender distribution per category (two variants). 
## How to run (pgAdmin 4)
1. **Create objects**: open Query Tool → run `sql/tables.sql` to create schemas/tables.
2. **Load CSVs** (GUI, recommended):
   - Import `customer_data.csv` into **retail.customers** (CSV, Header ✓).
   - Import `sales_data.csv` into **staging.staging_sales_raw** (CSV, Header ✓).
3. **Transform to final**: open Query Tool → run `sql/data.sql` to insert into `retail.sales` (date parsing + numeric cast). 
4. **Run analytics**: execute queries from `sql/retail_sales.sql` one-by-one in pgAdmin.
5. **(Optional) Export results**: in the result grid, click the **disk** icon and save CSVs into a `/results` folder for your repo.

## Notes
- Requires PostgreSQL 13+ (tested on 17). Uses `to_date('12-08-2025)` when loading sales. 
- If you prefer server‑side `COPY`, adapt paths and permissions (or keep using pgAdmin Import/Export to avoid file access issues).

## Example questions covered
- What is the total revenue? (sum of `quantity*price`)   
- Which category generates the most sales revenue? 
- Which 3 malls lead by revenue? 
- How does gender distribute across categories? 
