-- Drop table if exists
DROP TABLE IF EXISTS recipes_all;

-- Create table schema
CREATE TABLE recipes_all (
    "RecipeId" SERIAL PRIMARY KEY,
    "Name" VARCHAR(255),
    "CookTime" INTERVAL,
    "PrepTime" INTERVAL,
    "TotalTime" INTERVAL,
    "DatePublished" TIMESTAMP,
    "Description" TEXT,
    "RecipeCategory" VARCHAR(255),
    "Keywords" TEXT,
    "RecipeIngredientQuantities" TEXT,
    "RecipeIngredientParts" TEXT,
    "AggregatedRating" DECIMAL(5, 2),
    "ReviewCount" INT,
    "Calories" DECIMAL(8, 2),
    "FatContent" DECIMAL(8, 2),
    "SaturatedFatContent" DECIMAL(8, 2),
    "CholesterolContent" DECIMAL(8, 2),
    "SodiumContent" DECIMAL(8, 2),
    "CarbohydrateContent" DECIMAL(8, 2),
    "FiberContent" DECIMAL(8, 2),
    "SugarContent" DECIMAL(8, 2),
    "ProteinContent" DECIMAL(8, 2),
    "RecipeServings" INT,
    "RecipeYield" VARCHAR(255),
    "RecipeInstructions" TEXT
);
