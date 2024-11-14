-- Q-2: Find Unique ID of Each Employee
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find the unique ID of each employee. If an employee does not have a unique ID, 
-- the result should display `NULL` for that employee's `unique_id`.
-- The `Employees` table contains the following columns:
-- 1. id: unique identifier for each employee
-- 2. name: name of the employee
-- The `EmployeeUNI` table contains:
-- 1. id: unique identifier for each employee, matching the `id` in `Employees`
-- 2. unique_id: unique identifier specifically for each employee, which may not be available for all employees

-- Solution Steps:
-- 1. Use a LEFT JOIN to combine `Employees` and `EmployeeUNI` tables on `id`.
-- 2. Select the `unique_id` from `EmployeeUNI`, with `NULL` for employees who do not have a `unique_id`.
-- 3. Order: Since no specific order is required, return results in any order.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Select unique_id and name
--     |
--     v
-- Use LEFT JOIN between Employees and EmployeeUNI
--     |
--     v
-- Display NULL for unique_id if no match in EmployeeUNI
--     |
--     v
--   Display result

-- Primary Solution:
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu ON e.id = eu.id;

-- Alternative Solution Using COALESCE to Explicitly Set NULL:
-- SELECT COALESCE(eu.unique_id, NULL) AS unique_id, e.name
-- FROM Employees e
-- LEFT JOIN EmployeeUNI eu ON e.id = eu.id;

-- Another Alternative Using UNION for Matched and Non-Matched Rows:
-- SELECT eu.unique_id, e.name
-- FROM Employees e
-- JOIN EmployeeUNI eu ON e.id = eu.id
-- UNION
-- SELECT NULL AS unique_id, e.name
-- FROM Employees e
-- WHERE e.id NOT IN (SELECT id FROM EmployeeUNI);
