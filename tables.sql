CREATE SCHEMA IF NOT EXISTS retail;
CREATE SCHEMA IF NOT EXISTS staging;
SET search_path TO retail;

CREATE TABLE IF NOT EXISTS customers (
  customer_id    TEXT PRIMARY KEY,
  gender         TEXT,
  age            NUMERIC(5,2),
  payment_method TEXT
);

CREATE TABLE IF NOT EXISTS sales (
  sales_id      BIGSERIAL PRIMARY KEY,
  invoice_no    TEXT,
  customer_id   TEXT,
  category      TEXT,
  quantity      INTEGER,
  price         NUMERIC(10,2),
  invoice_date  DATE,
  shopping_mall TEXT
);

-- Staging table for the raw sales CSV
SET search_path TO staging;
CREATE TABLE IF NOT EXISTS staging_sales_raw (
  invoice_no    TEXT,
  customer_id   TEXT,
  category      TEXT,
  quantity      INTEGER,
  price         TEXT,
  invoice_date  TEXT,
  shopping_mall TEXT
);
