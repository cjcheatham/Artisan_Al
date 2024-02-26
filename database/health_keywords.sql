-- Drop table if it already exists 
DROP TABLE IF EXISTS health_keywords;

-- Create the health_keywords table
CREATE TABLE health_keywords (
    RecipeId INT,
    Name VARCHAR(255),
    Keywords TEXT
);

-- Insert data into the health_keywords table
INSERT INTO health_keywords (RecipeId, Name, Keywords)
SELECT 
    RecipeId,
    Name,
    CASE 
        WHEN (
            LOWER(Keywords) LIKE '%high fiber%' OR
            LOWER(Keywords) LIKE '%high in%' OR
            LOWER(Keywords) LIKE '%high protein%' OR
            LOWER(Keywords) LIKE '%homeopathy/remedies%' OR
            LOWER(Keywords) LIKE '%kid friendly%' OR
            LOWER(Keywords) LIKE '%lactose free%' OR
            LOWER(Keywords) LIKE '%low cholesterol%' OR
            LOWER(Keywords) LIKE '%low protein%' OR
            LOWER(Keywords) LIKE '%no shell fish%' OR
            LOWER(Keywords) LIKE '%soy/tofu%' OR
            LOWER(Keywords) LIKE '%very low carbs%' OR
            LOWER(Keywords) LIKE '%high in% diabetic friendly%' OR
            LOWER(Keywords) LIKE '%bath/beauty%' OR
            LOWER(Keywords) LIKE '%egg free%' OR
            LOWER(Keywords) LIKE '%healthy%' OR
            LOWER(Keywords) LIKE '%kosher%' OR
            LOWER(Keywords) LIKE '%toddler friendly%' OR
            LOWER(Keywords) LIKE '%vegan%' OR
            LOWER(Keywords) LIKE '%vegetable%'
        )
        THEN CONCAT_WS(
            ', ',
            CASE WHEN LOWER(Keywords) LIKE '%high fiber%' THEN 'High Fiber' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%high in%' THEN 'High In' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%high protein%' THEN 'High Protein' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%homeopathy/remedies%' THEN 'Homeopathy/Remedies' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%kid friendly%' THEN 'Kid Friendly' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%lactose free%' THEN 'Lactose Free' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%low cholesterol%' THEN 'Low Cholesterol' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%low protein%' THEN 'Low Protein' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%no shell fish%' THEN 'No Shell Fish' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%soy/tofu%' THEN 'Soy/Tofu' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%very low carbs%' THEN 'Very Low Carbs' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%high in% diabetic friendly%' THEN 'High In Diabetic Friendly' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%bath/beauty%' THEN 'Bath/Beauty' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%egg free%' THEN 'Egg Free' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%healthy%' THEN 'Healthy' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%kosher%' THEN 'Kosher' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%toddler friendly%' THEN 'Toddler Friendly' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%vegan%' THEN 'Vegan' ELSE NULL END,
            CASE WHEN LOWER(Keywords) LIKE '%vegetable%' THEN 'Vegetable' ELSE NULL END
        )
        ELSE 'NAN'
    END AS Keywords
FROM
    recipes_all;
	
-- Select all from this table to see if it worked:
SELECT * FROM health_keywords;

