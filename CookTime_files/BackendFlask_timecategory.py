from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/get_recipes", methods=["POST"])
def get_recipes():
    # Get the selected time category from the request data
    selected_category = request.json.get("category")
    
    # Call the recipe generator function with the selected category
    recipes = find_recipe_by_time_category(selected_category)
    
    # Return the recipes as JSON response
    return jsonify(recipes)

if __name__ == "__main__":
    app.run(debug=True)