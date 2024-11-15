-- Q-1: Rising Temperature
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find all the dates' IDs where the temperature on that day was higher than the previous day (yesterday).
-- We have a table called `Weather` with the following columns:
-- - `id`: Unique identifier for each row.
-- - `recordDate`: The date of the temperature record.
-- - `temperature`: The temperature recorded on that particular date.
-- We need to return the `id` for the dates where the temperature was higher compared to the previous day's temperature.

-- Solution Steps:
-- 1. Use the `LAG()` window function to get the temperature of the previous day for each record, ordered by `recordDate`.
-- 2. Compare the temperature of the current day (`temperature`) with the temperature of the previous day (`prev_temp`).
-- 3. Filter for rows where the current day's temperature is higher than the previous day's temperature.
-- 4. Return the `id` of such rows where the condition is satisfied.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- Use LAG() to get the previous day's temperature
--     |
--     v
-- Compare current temperature with previous day's temperature
--     |
--     v
-- Filter for dates where current temperature is higher than the previous day's
--     |
--     v
-- Display result (id of dates with higher temperature)

-- Primary Solution:
SELECT id
FROM (
    SELECT id, temperature, LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM Weather
) AS temp_comparison
WHERE temperature > prev_temp;

-- Alternative Solution Using Self Join (In case you prefer a JOIN approach):
-- SELECT w1.id
-- FROM Weather w1
-- JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
-- WHERE w1.temperature > w2.temperature;
