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

