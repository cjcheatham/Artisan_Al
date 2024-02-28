# ArtisanAl - UCB Data Analytics Bootcamp Project 4

## Introduction
Need help figuring out what to cook? Look no further,our recipe generator is a user-friendly tool designed to make meal planning easy and enjoyable. Whether you're cooking for a special occasion, adhering to specific dietary restrictions, or simply short on time, our generator has you covered. With just a few clicks, you'll discover a variety of delicious recipes tailored to your preferences.

## Process
Within the data analysis folder, there contains 3 jupyter notebook files that were used in the data cleaning process and analysis of our recipe data. The first one used was ingredients_cleaning. This data set took our sample data (a cut down version of our large data set) and added a binary matrix for each unique ingredient found within the data. If the ingredient is found in the recipe, 1 is shown, if not, 0 is shown. The big_data_cleaning file uses similar processes to ingredients_cleaning to add the health keywords to the large data file. Due to the size of this file, the binary matrix was dropped from this file. File with the name 2e_Health averages analysis has data analysis done on our large data file. The main points of analysis were comparing each of our health keyword categories on their average calories, fat content, and sugar content to see which category would have the highest of each. This file is named the way it is to fit within the style of the main branch.

## Personal Info
### Cody Cheatham - Data Engineer
- **Contribution:**
    1. Collaborated with the team to understand the project requirements and define the scope of the recommendation system.
    2. Designed and implemented the relational database schema for storing recipe data, considering factors such as data normalization, integrity constraints, and query performance.
    3. Implemented data cleaning and preprocessing pipelines to identify and handle missing values, outliers, and inconsistencies in the recipe dataset.
    4. Developed scripts and procedures to transform raw data into a structured format suitable for analysis and integration into the Recipe Generator platform.


## Resources Used / Acknowledgements
We used public datasets for our projects. Below, you can find our sources: 
- Food.com - Recipes and Reviews (https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviews)(https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviewsL)
- (https://www.cdss.ca.gov/agedblinddisabled/res/VPTC2/9%20Food%20Nutrition%20and%20Preparation/Types_of_Therapeutic_Diets.pdf)
- [Food.com] (https://www.food.com/)
