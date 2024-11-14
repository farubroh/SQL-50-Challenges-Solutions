Q--- Q-1: Find All Authors Who Viewed Their Own Articles
-- Problem Link: <Add your link here if available>

-- Summary:
-- The task is to find all authors who have viewed at least one of their own articles.
-- The `Views` table includes four columns:
-- 1. article_id: identifier for each article
-- 2. author_id: identifier for the author who wrote the article
-- 3. viewer_id: identifier for the viewer who viewed the article
-- 4. view_date: date when the article was viewed
-- Note: An author viewing their own article means `author_id` equals `viewer_id`.

-- Solution Steps:
-- 1. Identify Condition: Select rows where `author_id` is equal to `viewer_id`.
-- 2. Formulate Query: Use a SELECT DISTINCT statement to retrieve unique `author_id` values that meet this condition.
-- 3. Alternative Solution: Use GROUP BY and HAVING to aggregate by `author_id` and check if the count of self-views is greater than zero.

-- Flowchart of the Solution:
--   Start
--     |
--     v
--  Select author_id
--     |
--     v
-- Filter rows where
-- author_id = viewer_id
--     |
--     v
--  Remove duplicates
--     |
--     v
--   Display result

-- Primary Solution:
SELECT DISTINCT author_id AS id 
FROM Views 
WHERE author_id = viewer_id 
ORDER BY id;

-- Alternative Solution Using GROUP BY and HAVING:
-- SELECT author_id AS id
-- FROM Views
-- GROUP BY author_id
-- HAVING SUM(CASE WHEN author_id = viewer_id THEN 1 ELSE 0 END) > 0
-- ORDER BY id ASC;
