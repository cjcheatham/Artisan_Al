-- Drop tables if it already exists exists
DROP TABLE IF EXISTS recipes_all;
DROP TABLE IF EXISTS health_keywords;
DROP TABLE IF EXISTS occasions_keywords;
DROP TABLE IF EXISTS country_keywords;
DROP TABLE IF EXISTS cook_time_keywords;
DROP TABLE IF EXISTS recipes_health_keywords;

-- Create Table
CREATE TABLE recipes_all (
    RecipeId SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    CookTime INTERVAL,
    PrepTime INTERVAL,
    TotalTime INTERVAL,
    DatePublished TIMESTAMP,
    Description TEXT,
    RecipeCategory VARCHAR(255),
    Keywords TEXT,
    RecipeIngredientQuantities TEXT,
    RecipeIngredientParts TEXT,
    AggregatedRating DECIMAL(5, 2),
    ReviewCount INT,
    Calories DECIMAL(8, 2),
    FatContent DECIMAL(8, 2),
    SaturatedFatContent DECIMAL(8, 2),
    CholesterolContent DECIMAL(8, 2),
    SodiumContent DECIMAL(8, 2),
    CarbohydrateContent DECIMAL(8, 2),
    FiberContent DECIMAL(8, 2),
    SugarContent DECIMAL(8, 2),
    ProteinContent DECIMAL(8, 2),
    RecipeServings INT,
    RecipeYield VARCHAR(255),
    RecipeInstructions TEXT
);

-- Copy recipes_cleaned data from directory, replace directory with you own directory.
COPY recipes_all FROM 'D:/Bootcamp/projects/Recipe_Generator/data/clean/recipes_cleaned.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',', QUOTE '"', ESCAPE '\', ENCODING 'UTF8');

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

-- Create the occasions_keywords table
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

-- Create the country_keywords table
CREATE TABLE country_keywords AS
SELECT 
    RecipeId,
    Name,
    COALESCE(
        CASE
            WHEN LOWER(Keywords) LIKE '%african%' THEN 'African'
            WHEN LOWER(Keywords) LIKE '%asian%' THEN 'Asian'
            WHEN LOWER(Keywords) LIKE '%australian%' THEN 'Australian'
            WHEN LOWER(Keywords) LIKE '%austrian%' THEN 'Austrian'
            WHEN LOWER(Keywords) LIKE '%belgian%' THEN 'Belgian'
            WHEN LOWER(Keywords) LIKE '%brazilian%' THEN 'Brazilian'
            WHEN LOWER(Keywords) LIKE '%cajun%' THEN 'Cajun'
            WHEN LOWER(Keywords) LIKE '%cambodian%' THEN 'Cambodian'
            WHEN LOWER(Keywords) LIKE '%canadian%' THEN 'Canadian'
            WHEN LOWER(Keywords) LIKE '%cantonese%' THEN 'Cantonese'
            WHEN LOWER(Keywords) LIKE '%caribbean%' THEN 'Caribbean'
            WHEN LOWER(Keywords) LIKE '%chilean%' THEN 'Chilean'
            WHEN LOWER(Keywords) LIKE '%chinese%' THEN 'Chinese'
            WHEN LOWER(Keywords) LIKE '%colombian%' THEN 'Colombian'
            WHEN LOWER(Keywords) LIKE '%costa rican%' THEN 'Costa Rican'
            WHEN LOWER(Keywords) LIKE '%creole%' THEN 'Creole'
            WHEN LOWER(Keywords) LIKE '%cuban%' THEN 'Cuban'
            WHEN LOWER(Keywords) LIKE '%czech%' THEN 'Czech'
            WHEN LOWER(Keywords) LIKE '%danish%' THEN 'Danish'
            WHEN LOWER(Keywords) LIKE '%dutch%' THEN 'Dutch'
            WHEN LOWER(Keywords) LIKE '%ecuadorean%' THEN 'Ecuadorean'
            WHEN LOWER(Keywords) LIKE '%egyptian%' THEN 'Egyptian'
            WHEN LOWER(Keywords) LIKE '%ethiopian%' THEN 'Ethiopian'
            WHEN LOWER(Keywords) LIKE '%european%' THEN 'European'
            WHEN LOWER(Keywords) LIKE '%filipino%' THEN 'Filipino'
            WHEN LOWER(Keywords) LIKE '%finnish%' THEN 'Finnish'
            WHEN LOWER(Keywords) LIKE '%georgian%' THEN 'Georgian'
            WHEN LOWER(Keywords) LIKE '%german%' THEN 'German'
            WHEN LOWER(Keywords) LIKE '%greek%' THEN 'Greek'
            WHEN LOWER(Keywords) LIKE '%guatemalan%' THEN 'Guatemalan'
            WHEN LOWER(Keywords) LIKE '%hawaiian%' THEN 'Hawaiian'
            WHEN LOWER(Keywords) LIKE '%honduran%' THEN 'Honduran'
            WHEN LOWER(Keywords) LIKE '%hunan%' THEN 'Hunan'
            WHEN LOWER(Keywords) LIKE '%hungarian%' THEN 'Hungarian'
            WHEN LOWER(Keywords) LIKE '%icelandic%' THEN 'Icelandic'
            WHEN LOWER(Keywords) LIKE '%indian%' THEN 'Indian'
            WHEN LOWER(Keywords) LIKE '%indonesian%' THEN 'Indonesian'
            WHEN LOWER(Keywords) LIKE '%iraqi%' THEN 'Iraqi'
            WHEN LOWER(Keywords) LIKE '%japanese%' THEN 'Japanese'
            WHEN LOWER(Keywords) LIKE '%korean%' THEN 'Korean'
            WHEN LOWER(Keywords) LIKE '%lebanese%' THEN 'Lebanese'
            WHEN LOWER(Keywords) LIKE '%malaysian%' THEN 'Malaysian'
            WHEN LOWER(Keywords) LIKE '%mexican%' THEN 'Mexican'
            WHEN LOWER(Keywords) LIKE '%mongolian%' THEN 'Mongolian'
            WHEN LOWER(Keywords) LIKE '%moroccan%' THEN 'Moroccan'
            WHEN LOWER(Keywords) LIKE '%native american%' THEN 'Native American'
            WHEN LOWER(Keywords) LIKE '%nepalese%' THEN 'Nepalese'
            WHEN LOWER(Keywords) LIKE '%new zealand%' THEN 'New Zealand'
            WHEN LOWER(Keywords) LIKE '%nigerian%' THEN 'Nigerian'
            WHEN LOWER(Keywords) LIKE '%norwegian%' THEN 'Norwegian'
            WHEN LOWER(Keywords) LIKE '%pakistani%' THEN 'Pakistani'
            WHEN LOWER(Keywords) LIKE '%palestinian%' THEN 'Palestinian'
            WHEN LOWER(Keywords) LIKE '%pennsylvania dutch%' THEN 'Pennsylvania Dutch'
            WHEN LOWER(Keywords) LIKE '%peruvian%' THEN 'Peruvian'
            WHEN LOWER(Keywords) LIKE '%polish%' THEN 'Polish'
            WHEN LOWER(Keywords) LIKE '%polynesian%' THEN 'Polynesian'
            WHEN LOWER(Keywords) LIKE '%portuguese%' THEN 'Portuguese'
            WHEN LOWER(Keywords) LIKE '%puerto rican%' THEN 'Puerto Rican'
            WHEN LOWER(Keywords) LIKE '%russian%' THEN 'Russian'
            WHEN LOWER(Keywords) LIKE '%scandinavian%' THEN 'Scandinavian'
            WHEN LOWER(Keywords) LIKE '%scottish%' THEN 'Scottish'
            WHEN LOWER(Keywords) LIKE '%somalian%' THEN 'Somalian'
            WHEN LOWER(Keywords) LIKE '%south african%' THEN 'South African'
            WHEN LOWER(Keywords) LIKE '%south american%' THEN 'South American'
            WHEN LOWER(Keywords) LIKE '%southwest asia (middle east)%' THEN 'Southwest Asia (Middle East)'
            WHEN LOWER(Keywords) LIKE '%southwestern u.s.%' THEN 'Southwestern U.S.'
            WHEN LOWER(Keywords) LIKE '%spanish%' THEN 'Spanish'
            WHEN LOWER(Keywords) LIKE '%sudanese%' THEN 'Sudanese'
            WHEN LOWER(Keywords) LIKE '%swedish%' THEN 'Swedish'
            WHEN LOWER(Keywords) LIKE '%swiss%' THEN 'Swiss'
            WHEN LOWER(Keywords) LIKE '%szechuan%' THEN 'Szechuan'
            WHEN LOWER(Keywords) LIKE '%tex mex%' THEN 'Tex Mex'
            WHEN LOWER(Keywords) LIKE '%thai%' THEN 'Thai'
            WHEN LOWER(Keywords) LIKE '%turkish%' THEN 'Turkish'
            WHEN LOWER(Keywords) LIKE '%venezuelan%' THEN 'Venezuelan'
            WHEN LOWER(Keywords) LIKE '%vietnamese%' THEN 'Vietnamese'
            WHEN LOWER(Keywords) LIKE '%welsh%' THEN 'Welsh'
            ELSE NULL
        END,
        'NAN'
    ) AS Keywords
FROM recipes_all;
			
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


  
  

