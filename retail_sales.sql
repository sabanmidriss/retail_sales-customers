---Retail Analytics

------------------------------------------------------------
-- 0) Quick sanity checks (peek at data)
------------------------------------------------------------
SELECT * FROM retail.customers LIMIT 5;
SELECT * FROM retail.sales LIMIT 5;

------------------------------------------------------------
-- 1) Total revenue
------------------------------------------------------------
SELECT
  SUM(quantity * price) AS total_revenue
FROM retail.sales;

------------------------------------------------------------
-- 2) Most popular product category
-- (A) By revenue
------------------------------------------------------------
SELECT
  category,
  SUM(quantity * price) AS total_revenue
FROM retail.sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;

------------------------------------------------------------
-- (B) By quantity (if needed)
------------------------------------------------------------
SELECT
  category,
  SUM(quantity) AS total_quantity
FROM retail.sales
GROUP BY category
ORDER BY total_quantity DESC
LIMIT 1;

------------------------------------------------------------
-- 3) Top 3 shopping malls by revenue
------------------------------------------------------------
SELECT
  shopping_mall,
  SUM(quantity * price) AS sales_revenue
FROM retail.sales
GROUP BY shopping_mall
ORDER BY sales_revenue DESC
LIMIT 3;

------------------------------------------------------------
-- 4) Gender distribution across product categories
-- (A) Counts per gender & category
------------------------------------------------------------
SELECT
  rc.gender,
  rs.category,
  COUNT(*) AS tx_count
FROM retail.sales AS rs
JOIN retail.customers AS rc
  ON rs.customer_id = rc.customer_id
GROUP BY rc.gender, rs.category
ORDER BY rs.category, tx_count DESC;

------------------------------------------------------------
-- (B) % share of each gender within its category (nice for reporting)
------------------------------------------------------------
SELECT
  rs.category,
  rc.gender,
  COUNT(*) AS tx_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY rs.category), 2) AS pct_in_category
FROM retail.sales AS rs
JOIN retail.customers AS rc
  ON rs.customer_id = rc.customer_id
GROUP BY rs.category, rc.gender
ORDER BY rs.category, pct_in_category DESC;

------------------------------------------------------------
-- 5) Methods of payment by gender (pivoted counts)
------------------------------------------------------------
SELECT
  gender,
  COUNT(*) FILTER (WHERE payment_method = 'Credit Card') AS credit_card_count,
  COUNT(*) FILTER (WHERE payment_method = 'Debit Card')  AS debit_card_count,
  COUNT(*) FILTER (WHERE payment_method = 'Cash')        AS cash_count
FROM retail.customers
GROUP BY gender
ORDER BY gender;

------------------------------------------------------------
-- 6) Category ranking (by number of rows/transactions)
------------------------------------------------------------
SELECT
  category,
  COUNT(*) AS tx_count,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS category_rank
FROM retail.sales
GROUP BY category
ORDER BY tx_count DESC;

------------------------------------------------------------
-- 7) Most sales by gender
-- (A) By revenue (recommended interpretation of "sales")
------------------------------------------------------------
SELECT
  rc.gender,
  SUM(rs.quantity * rs.price) AS total_revenue
FROM retail.sales AS rs
JOIN retail.customers AS rc
  ON rs.customer_id = rc.customer_id
GROUP BY rc.gender
ORDER BY total_revenue DESC
LIMIT 1;

------------------------------------------------------------
-- (B) By number of transactions
------------------------------------------------------------
SELECT
  rc.gender,
  COUNT(*) AS sales_count
FROM retail.sales AS rs
JOIN retail.customers AS rc
  ON rs.customer_id = rc.customer_id
GROUP BY rc.gender
ORDER BY sales_count DESC
LIMIT 1;

-- End of sheet





