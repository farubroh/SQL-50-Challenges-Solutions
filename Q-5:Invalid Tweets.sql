-- Q-1: Find Invalid Tweets
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find the IDs of tweets that are considered invalid due to their content length exceeding 15 characters.
-- The `Tweets` table includes two columns:
-- 1. tweet_id: unique identifier for each tweet
-- 2. content: text of the tweet
-- A tweet is invalid if `LENGTH(content) > 15`.

-- Solution Steps:
-- 1. Identify Condition: We need tweets where the character count of `content` exceeds 15.
-- 2. Formulate Query: Use the LENGTH function to filter for tweets that have content length greater than 15.
-- 3. Alternative Solution: Use CHAR_LENGTH instead of LENGTH to count characters, depending on database compatibility.

-- Flowchart of the Solution:
--   Start
--     |
--     v
--  Select tweet_id
--     |
--     v
-- Filter rows where
-- LENGTH(content) > 15
--     |
--     v
--   Display result

-- Primary Solution:
SELECT tweet_id 
FROM Tweets 
WHERE LENGTH(content) > 15;

-- Alternative Solution Using CHAR_LENGTH:
-- SELECT tweet_id
-- FROM Tweets
-- WHERE CHAR_LENGTH(content) > 15;
