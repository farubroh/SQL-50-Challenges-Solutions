-- Q-7: Product Sales Analysis I
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to report the product_name, year, and price for each sale_id in the Sales table. 
-- Each row in the Sales table represents a sale of a product, and we need to fetch the 
-- corresponding product name from the Product table based on the product_id. 
-- The price in the Sales table is per unit, and we need to display it along with the 
-- product name and year for each sale.


-- Solution Steps:
-- 1. Use an INNER JOIN between the `Sales` table and the `Product` table, linking them by `product_id`.
-- 2. Select `product_name`, `year`, and `price` for each sale from the combined result.
-- 3. The query should return the product name, sale year, and price for each sale.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Join Sales and Product tables on product_id
--     |
--     v
-- Select product_name, year, and price
--     |
--     v
-- Display result

-- Primary Solution:
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p ON s.product_id = p.product_id;

-- Alternative Solution Using LEFT JOIN (In case some sales don't have a matching product):
-- SELECT p.product_name, s.year, s.price
-- FROM Sales s
-- LEFT JOIN Product p ON s.product_id = p.product_id;

--
