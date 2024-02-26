-- Drop table if it already exists
DROP TABLE IF EXISTS occasions_keywords;

-- Create occasions_keywords table
CREATE TABLE occasions_keywords AS
SELECT 
    RecipeId,
    Name,
    COALESCE(
        CASE
            WHEN LOWER(Keywords) LIKE '%birthday%' THEN 'Birthday'
            WHEN LOWER(Keywords) LIKE '%breakfast%' THEN 'Breakfast'
            WHEN LOWER(Keywords) LIKE '%ramadan%' THEN 'Ramadan'
            WHEN LOWER(Keywords) LIKE '%brunch%' THEN 'Brunch'
            WHEN LOWER(Keywords) LIKE '%camping%' THEN 'Camping'
            WHEN LOWER(Keywords) LIKE '%chinese new year%' THEN 'Chinese New Year'
            WHEN LOWER(Keywords) LIKE '%christmas%' THEN 'Christmas'
            WHEN LOWER(Keywords) LIKE '%for large groups%' THEN 'For Large Groups'
            WHEN LOWER(Keywords) LIKE '%halloween%' THEN 'Halloween'
            WHEN LOWER(Keywords) LIKE '%hanukkah%' THEN 'Hanukkah'
            WHEN LOWER(Keywords) LIKE '%household cleaner%' THEN 'Household Cleaner'
            WHEN LOWER(Keywords) LIKE '%labor day%' THEN 'Labor Day'
            WHEN LOWER(Keywords) LIKE '%memorial day%' THEN 'Memorial Day'
            WHEN LOWER(Keywords) LIKE '%reynolds wrap contest%' THEN 'Reynolds Wrap Contest'
            WHEN LOWER(Keywords) LIKE '%spring%' THEN 'Spring'
            WHEN LOWER(Keywords) LIKE '%st. patrick''s day%' THEN 'St. Patrick''s Day'
            WHEN LOWER(Keywords) LIKE '%summer%' THEN 'Summer'
            WHEN LOWER(Keywords) LIKE '%thanksgiving%' THEN 'Thanksgiving'
            WHEN LOWER(Keywords) LIKE '%weeknight%' THEN 'Weeknight'
            WHEN LOWER(Keywords) LIKE '%for large groups holiday/event%' THEN 'For Large Groups Holiday/Event'
            WHEN LOWER(Keywords) LIKE '%halloween cocktail%' THEN 'Halloween Cocktail'
            WHEN LOWER(Keywords) LIKE '%served hot new years%' THEN 'Served Hot New Years'
            ELSE NULL
        END,
        'NAN'
    ) AS Keywords
FROM recipes_all;

-- Select all from this table to see if it worked:
SELECT * FROM occasions_keywords;