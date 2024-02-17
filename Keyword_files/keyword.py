from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/search_recipes_by_keyword", methods=["POST"])
def search_recipes_by_keyword():
    # Get the keyword from the request data
    keyword = request.json.get("keyword")
    
    # Call the recipe generator function with the provided keyword
    recipes = search_recipes_by_keyword(keyword)
    
    # Return the recipes as JSON response
    return jsonify(recipes)

if __name__ == "__main__":
    app.run(debug=True)