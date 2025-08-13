SET search_path TO retail;

INSERT INTO sales (invoice_no, customer_id, category, quantity, price, invoice_date, shopping_mall)
SELECT
  NULLIF(invoice_no, ''),
  NULLIF(customer_id, ''),
  NULLIF(category, ''),
  quantity,
  NULLIF(price, '')::NUMERIC(10,2),
  to_date(invoice_date, 'DD-MM-YYYY'),
  NULLIF(shopping_mall, '')
FROM staging.staging_sales_raw;
