-- Drop table if exists
DROP TABLE IF EXISTS recipes_all;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS nutritional_info;
DROP TABLE IF EXISTS Keywords; 

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

-- Show data from the inital table
SELECT * FROM recipes_all

CREATE TABLE categories AS
SELECT DISTINCT RecipeCategory
FROM recipes_all;

CREATE TABLE ingredients AS
SELECT DISTINCT unnest(string_to_array(RecipeIngredientParts, ', ')) AS ingredient
FROM recipes_all;

CREATE TABLE ratings AS
SELECT RecipeId, AggregatedRating, ReviewCount
FROM recipes_all;

CREATE TABLE nutritional_info AS
SELECT RecipeId, Calories, FatContent, SaturatedFatContent, CholesterolContent, SodiumContent, CarbohydrateContent, FiberContent, SugarContent, ProteinContent
FROM recipes_all;

CREATE TABLE Keywords (
    KeywordId SERIAL PRIMARY KEY,
    Keyword VARCHAR(255) UNIQUE,
    Description TEXT
);

-- Create the health_keywords table
CREATE TABLE health_keywords (
    RecipeId INT,
    Name VARCHAR(255),
    Keywords TEXT
);

-- Insert data into the health_keywords table
INSERT INTO health_keywords (RecipeId, Name, Keywords)
SELECT RecipeId, Name, Keywords
FROM recipes_all
WHERE Keywords ILIKE '%High Fiber%'
   OR Keywords ILIKE '%High Protein%'
   OR Keywords ILIKE '%Homeopathy/Remedies%'
   OR Keywords ILIKE '%Kid Friendly%'
   OR Keywords ILIKE '%Lactose Free%'
   OR Keywords ILIKE '%Low Cholesterol%'
   OR Keywords ILIKE '%Low Protein%'
   OR Keywords ILIKE '%No Shell Fish%'
   OR Keywords ILIKE '%Soy/Tofu%'
   OR Keywords ILIKE '%Very Low Carbs%'
   OR Keywords ILIKE '%High In... Diabetic Friendly%'
   OR Keywords ILIKE '%Bath/Beauty%'
   OR Keywords ILIKE '%Egg Free%'
   OR Keywords ILIKE '%Healthy%'
   OR Keywords ILIKE '%Kosher%'
   OR Keywords ILIKE '%Toddler Friendly%'
   OR Keywords ILIKE '%Vegan%'
   OR Keywords ILIKE '%Vegetable%';



