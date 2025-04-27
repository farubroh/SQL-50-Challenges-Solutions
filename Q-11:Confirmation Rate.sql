-- Q-11: Confirmation Rate
-- Problem Link: https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50


[Visualization_of_table](https://github.com/farubroh/SQL-50-Challenges-Solutions/blob/main/Images/Picture-1.JPG)


-- Summary:
-- The task is to find the confirmation rate for each user based on their confirmation requests.
-- We have two tables:
-- 1. `Signups`:
--    - `user_id`: Unique identifier for each user.
--    - `time_stamp`: The signup time for the user.
-- 2. `Confirmations`:
--    - `user_id`: User ID who requested confirmation.
--    - `time_stamp`: Time when confirmation message was sent.
--    - `action`: Either 'confirmed' or 'timeout' indicating if the user confirmed or not.
-- 
-- The confirmation rate is defined as:
-- (Number of 'confirmed' actions) / (Total number of confirmation requests)
-- If a user made no requests, their confirmation rate is 0.
-- The confirmation rate should be rounded to two decimal places.

-- Solution Steps:
-- 1. Perform a LEFT JOIN between `Signups` and `Confirmations` tables on `user_id`.
-- 2. For each user:
--    - Treat 'confirmed' actions as 1 and others ('timeout' or NULL) as 0.
-- 3. Take the average of these 1s and 0s to get the confirmation rate.
-- 4. Round the average to two decimal places.
-- 5. Group the result by `user_id` to get individual confirmation rates.

-- Flowchart of the Solution:
--   Start
--     |
--     v
-- LEFT JOIN Signups with Confirmations on user_id
--     |
--     v
-- Assign 1 for 'confirmed', 0 otherwise
--     |
--     v
-- Calculate average for each user_id
--     |
--     v
-- Round to two decimal places
--     |
--     v
-- Display result (user_id and confirmation_rate)

-- Primary Solution Using LEFT JOIN and AVG:
SELECT
    s.user_id,
    ROUND(
        AVG(
            CASE 
                WHEN c.action = 'confirmed' THEN 1.00
                ELSE 0
            END
        ),
        2
    ) AS confirmation_rate
FROM
    Signups s
LEFT JOIN
    Confirmations c
    ON
    s.user_id = c.user_id
GROUP BY
    s.user_id;

-- Alternate Shorter Syntax:
SELECT 
    s.user_id, 
    ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM 
    Signups s 
LEFT JOIN 
    Confirmations c 
ON 
    s.user_id = c.user_id 
GROUP BY 
    s.user_id;

-- This solution ensures that all users are included (even those who made no requests) and accurately calculates and rounds their confirmation rates.
