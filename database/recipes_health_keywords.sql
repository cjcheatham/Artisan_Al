-- Drop table if it exists
DROP TABLE IF EXISTS recipes_health_keywords;

-- Create the recipes_health_keywords table
CREATE TABLE recipes_health_keywords AS
SELECT
    RecipeId,
    Name,
    CookTime,
    PrepTime,
    TotalTime,
    DatePublished,
    Description,
    RecipeCategory,
    Keywords,
    RecipeIngredientQuantities,
    RecipeIngredientParts,
    AggregatedRating,
    ReviewCount,
    Calories,
    FatContent,
    SaturatedFatContent,
    CholesterolContent,
    SodiumContent,
    CarbohydrateContent,
    FiberContent,
    SugarContent,
    ProteinContent,
    RecipeServings,
    RecipeYield,
    RecipeInstructions,
    CASE WHEN Keywords ILIKE '%High Fiber%' THEN 'TRUE' ELSE 'FALSE' END AS "High Fiber",
    CASE WHEN Keywords ILIKE '%High In...%' THEN 'TRUE' ELSE 'FALSE' END AS "High In...",
    CASE WHEN Keywords ILIKE '%High Protein%' THEN 'TRUE' ELSE 'FALSE' END AS "High Protein",
    CASE WHEN Keywords ILIKE '%Homeopathy/Remedies%' THEN 'TRUE' ELSE 'FALSE' END AS "Homeopathy/Remedies",
    CASE WHEN Keywords ILIKE '%Kid Friendly%' THEN 'TRUE' ELSE 'FALSE' END AS "Kid Friendly",
    CASE WHEN Keywords ILIKE '%Lactose Free%' THEN 'TRUE' ELSE 'FALSE' END AS "Lactose Free",
    CASE WHEN Keywords ILIKE '%Low Cholesterol%' THEN 'TRUE' ELSE 'FALSE' END AS "Low Cholesterol",
    CASE WHEN Keywords ILIKE '%Low Protein%' THEN 'TRUE' ELSE 'FALSE' END AS "Low Protein",
    CASE WHEN Keywords ILIKE '%No Shell Fish%' THEN 'TRUE' ELSE 'FALSE' END AS "No Shell Fish",
    CASE WHEN Keywords ILIKE '%Soy/Tofu%' THEN 'TRUE' ELSE 'FALSE' END AS "Soy/Tofu",
    CASE WHEN Keywords ILIKE '%Very Low Carbs%' THEN 'TRUE' ELSE 'FALSE' END AS "Very Low Carbs",
    CASE WHEN Keywords ILIKE '%High In... Diabetic Friendly%' THEN 'TRUE' ELSE 'FALSE' END AS "High In... Diabetic Friendly",
    CASE WHEN Keywords ILIKE '%Bath/Beauty%' THEN 'TRUE' ELSE 'FALSE' END AS "Bath/Beauty",
    CASE WHEN Keywords ILIKE '%Egg Free%' THEN 'TRUE' ELSE 'FALSE' END AS "Egg Free",
    CASE WHEN Keywords ILIKE '%Healthy%' THEN 'TRUE' ELSE 'FALSE' END AS "Healthy",
    CASE WHEN Keywords ILIKE '%Kosher%' THEN 'TRUE' ELSE 'FALSE' END AS "Kosher",
    CASE WHEN Keywords ILIKE '%Toddler Friendly%' THEN 'TRUE' ELSE 'FALSE' END AS "Toddler Friendly",
    CASE WHEN Keywords ILIKE '%Vegan%' THEN 'TRUE' ELSE 'FALSE' END AS "Vegan",
    CASE WHEN Keywords ILIKE '%Vegetable%' THEN 'TRUE' ELSE 'FALSE' END AS "Vegetable"
FROM
    recipes_all;


-- Show all data from the table to see if it worked
SELECT * FROM recipes_health_keywords;