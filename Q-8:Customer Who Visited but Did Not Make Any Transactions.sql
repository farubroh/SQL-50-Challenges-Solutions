-- Q-8: Customer Who Visited but Did Not Make Any Transactions
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find the customer IDs who visited the mall but did not make any transactions, 
-- and to count how many times they made such visits.
-- We have two tables:
-- - `Visits`: Contains the `visit_id` and `customer_id` for each visit.
-- - `Transactions`: Contains the `transaction_id`, `visit_id`, and `amount` for each transaction made during a visit.
-- We need to return the `customer_id` and the number of visits where the customer did not make any transactions.

-- Solution Steps:
-- 1. Perform a LEFT JOIN between the `Visits` table and the `Transactions` table on `visit_id`.
-- 2. Use `WHERE` condition to filter for rows where `transaction_id` is NULL, indicating no transaction was made.
-- 3. Group by `customer_id` and count the number of such visits (those without a transaction).
-- 4. Return the result with `customer_id` and `count_no_trans` (the number of visits with no transactions).

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Perform LEFT JOIN between Visits and Transactions on visit_id
--     |
--     v
-- Filter for visits with no transactions (NULL transaction_id)
--     |
--     v
-- Group by customer_id and count the number of visits with no transactions
--     |
--     v
-- Display result

-- Primary Solution:
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Alternative Solution Using NOT EXISTS (In case you prefer a subquery approach):
-- SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
-- FROM Visits v
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM Transactions t
--     WHERE t.visit_id = v.visit_id
-- )
-- GROUP BY v.customer_id;
