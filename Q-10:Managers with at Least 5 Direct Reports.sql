-- Q-XX: Managers with at Least 5 Direct Reports
-- Problem Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50>

-- Summary:
-- The task is to find all managers who have at least five direct reports (employees who report directly to them).
-- We have a table called `Employee` with the following columns:
-- - `id`: Unique identifier for each employee.
-- - `name`: Name of the employee.
-- - `department`: Department to which the employee belongs.
-- - `managerId`: ID of the employee’s direct manager (can be null if the employee has no manager).
-- We need to return the names of those employees who are managers with **five or more** direct reports.

-- Solution Steps:
-- 1. Group the `Employee` table by `managerId`.
-- 2. Count the number of employees reporting to each manager.
-- 3. Filter the groups where the count of direct reports is greater than or equal to 5.
-- 4. Join the filtered manager IDs back to the `Employee` table to get the corresponding manager names.
-- 5. Return the `name` of these managers.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Group employees by managerId and count direct reports
--     |
--     v
-- Filter managers with at least 5 direct reports
--     |
--     v
-- Join with Employee table to get manager names
--     |
--     v
-- Display result (names of managers)

-- Primary Solution Using GROUP BY and HAVING:
select e.name from Employee as e where e.id in(
    select managerId from Employee 
    where managerId is not null
    group by managerId
    having count(managerId)>=5
)
-- Alternative Solutio
SELECT e.name
FROM Employee e
WHERE e.id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(id) >= 5
);


-- This solution ensures that only managers with five or more direct reports are selected, and it returns their names accordingly.
