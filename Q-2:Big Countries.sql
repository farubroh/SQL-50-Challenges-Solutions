-- Q-3: Find Big Countries
-- Problem Link: https://leetcode.com/problems/big-countries/

-- Summary:
-- The task is to find the names, populations, and areas of countries that are considered "big."
-- A country is defined as "big" if:
-- 1. It has an area of at least three million (3,000,000 km²), or
-- 2. It has a population of at least twenty-five million (25,000,000).
-- 
-- Solution Steps:
-- 1. Identify Conditions: The country must meet at least one of the following conditions:
--     - area >= 3000000
--     - population >= 25000000
-- 2. Formulate Query: Use a SELECT statement with a WHERE clause to filter based on the conditions.
-- 3. Explore Alternative Solutions: Consider using UNION, CASE, EXISTS, or IF for different approaches.

-- Flowchart of the Solution:
--   Start
--     |
--     v
--  Select name, population, area
--     |
--     v
-- Filter rows where
--   area >= 3000000 OR
--   population >= 25000000
--     |
--     v
--   Display result

-- Primary Solution:
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;

-- Alternative Solution 1: Using UNION for Separate Conditions
-- SELECT name, population, area
-- FROM World
-- WHERE area >= 3000000
-- UNION
-- SELECT name, population, area
-- FROM World
-- WHERE population >= 25000000;

--
