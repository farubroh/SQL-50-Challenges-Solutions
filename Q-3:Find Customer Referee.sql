-- Q-2: Find Customer Referee
-- Problem Link: https://leetcode.com/problems/find-customer-referee/

-- Summary:
-- The task is to find the names of customers who are not referred by the customer with `id = 2`.
-- The `Customer` table includes three columns:
-- 1. id: unique identifier for each customer
-- 2. name: name of the customer
-- 3. referee_id: the id of the customer who referred them (can be NULL if not referred)

-- Solution Steps:
-- 1. Identify Conditions: We want customers where `referee_id` is not equal to 2 or is NULL.
-- 2. Formulate Query: Use a SELECT statement with a WHERE clause that filters rows with `referee_id != 2` or `referee_id IS NULL`.
-- 3. Alternative Solution: Use a NOT IN subquery to exclude customers who were referred by the customer with `id = 2`.

-- Flowchart of the Solution:
--   Start
--     |
--     v
--  Select name
--     |
--     v
-- Filter rows where
-- referee_id != 2 OR
-- referee_id IS NULL
--     |
--     v
--   Display result

-- Primary Solution:
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

-- Alternative Solution Using NOT IN:
-- SELECT name
-- FROM Customer
-- WHERE id NOT IN (
--     SELECT id 
--     FROM Customer 
--     WHERE referee_id = 2
-- );
