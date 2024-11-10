

-- Problem Link: https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Solution Steps:
-- 1. Identify Conditions: We want products where both low_fats and recyclable fields are 'Y'.
-- 2. Formulate Query: Use a SELECT statement with a WHERE clause that filters rows with low_fats = 'Y' and recyclable = 'Y'.
-- 3. Alternative Solution: Consider using INTERSECT for databases that support it.

-- Flowchart of the Solution:
--   Start
--     |
--     v
--  Select product_id
--     |
--     v
-- Filter rows where
-- low_fats = 'Y' AND
-- recyclable = 'Y'
--     |
--     v
--   Display result

-- Primary Solution:
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- Alternative Solution Using INTERSECT (if supported by the database):
-- SELECT product_id
-- FROM Products
-- WHERE low_fats = 'Y'
-- INTERSECT
-- SELECT product_id
-- FROM Products
-- WHERE recyclable = 'Y';
