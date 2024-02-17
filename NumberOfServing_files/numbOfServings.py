from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/get_recipes_by_servings", methods=["POST"])
def get_recipes_by_servings():
    # Get the selected number of servings from the request data
    selected_servings = request.json.get("servings")
    
    # Call the recipe generator function with the selected number of servings
    recipes = find_recipe_by_servings(selected_servings)
    
    # Return the recipes as JSON response
    return jsonify(recipes)

if __name__ == "__main__":
    app.run(debug=True)