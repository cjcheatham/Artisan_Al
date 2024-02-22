from flask import Flask, jsonify
import json
import load_table, ML_analysis_based_on_web_input


# 2. Create an app, being sure to pass __name__
app = Flask(__name__)

# 3. Define what to do when a user hits the index route
@app.route("/")
def home():
    df_ingredient, df_keyword = load_table.load_table()
    print("Tables loaded")
    # return df_ingredient, df_keyword
    # print(json.dumps(ML_analysis_based_on_web_input.top_ingredients(df_ingredient, df_keyword)))
    return json.dumps(ML_analysis_based_on_web_input.top_ingredients(df_ingredient, df_keyword))

# 4. Define what to do when a user hits the /about route
# @app.route("/about")
# def ML(df_ingredient, df_keyword):
#     print("top ingredients table")
#     return ML_analysis_based_on_web_input.top_ingredients(df_ingredient, df_keyword)


if __name__ == "__main__":
    # app.run(host='127.0.0.1', port=5000, debug=True)
    app.run(debug=True)