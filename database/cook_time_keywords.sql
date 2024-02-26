-- Drop table if it exists
DROP TABLE IF EXISTS cook_time_keywords;

-- Create the cook_time_keywords table 
CREATE TABLE cook_time_keywords AS
SELECT 
    RecipeId,
    Name,
    COALESCE(
        CASE
            WHEN LOWER(Keywords) LIKE '%< 15 mins%' THEN '< 15 Mins'
            WHEN LOWER(Keywords) LIKE '%< 30 mins%' THEN '< 30 Mins'
            WHEN LOWER(Keywords) LIKE '%< 60 mins%' THEN '< 60 Mins'
            WHEN LOWER(Keywords) LIKE '%< 4 hours%' THEN '< 4 Hours'
            ELSE NULL
        END,
        'NAN'
    ) AS Keywords
FROM recipes_all;


-- Select all from this table to see if it worked:
SELECT * FROM cook_time_keywords;


