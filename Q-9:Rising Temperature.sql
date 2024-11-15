-- Q-9: Rising Temperature
-- Problem Link: <Add your link here if available>

-- -- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find all the dates' IDs where the temperature on that day was higher than the previous day (yesterday).
-- We have a table called `Weather` with the following columns:
-- - `id`: Unique identifier for each row.
-- - `recordDate`: The date of the temperature record.
-- - `temperature`: The temperature recorded on that particular date.
-- We need to return the `id` for the dates where the temperature was higher compared to the previous day's temperature, considering only consecutive days.

-- Solution Steps:
-- 1. Perform a self-join on the `Weather` table, matching consecutive days based on the `recordDate`.
-- 2. Use `DATE_ADD()` to check if the `recordDate` of `w1` is exactly one day after `w2.recordDate`.
-- 3. Filter the rows where the current day's temperature (`w1.temperature`) is greater than the previous day's temperature (`w2.temperature`).
-- 4. Return the `id` of such rows where the condition is satisfied.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Perform self-join on consecutive days using DATE_ADD()
--     |
--     v
-- Compare current temperature with previous day's temperature
--     |
--     v
-- Filter for dates where current temperature is higher than the previous day's
--     |
--     v
-- Display result (id of dates with higher temperature)

-- Primary Solution Using Self Join:
SELECT w1.id
FROM Weather w1
JOIN Weather w2 
  ON DATE_ADD(w2.recordDate, INTERVAL 1 DAY) = w1.recordDate
WHERE w1.temperature > w2.temperature;

-- This solution ensures that we only compare consecutive days and avoid gaps between dates.
