def top_ingredients(df_ingredient, df_keyword):

    import pandas as pd
    from pathlib import Path
    import hvplot.pandas
    from sklearn.cluster import KMeans
    from sklearn.ensemble import RandomForestClassifier
    from sklearn.preprocessing import StandardScaler
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
    from sklearn.decomposition import PCA
    from sklearn.linear_model import LinearRegression

    df_ingredient = pd.DataFrame(df_ingredient)
    df_keyword = pd.DataFrame(df_keyword)

    ##USER INPUT
    recipe_type=['low protein']
    cook_time=['< 4 Hours']
    Region=['indian']
    # ingredient_list=['mint leaves','white sugar']

    input_selection={
        'Health':list(map(str.lower,recipe_type)),
        'Prep Time':list(map(str.lower,cook_time)),
        'Country':list(map(str.lower,Region))}
        # 'Ingredients':list(map(str.lower,ingredient_list))}


    df_combined_keyword=df_keyword.copy()
    df_combined_ingredient=df_ingredient.copy()


    ##DATA CLEANUP
    #Filter based on input_selection
    # filter = df_combined_keyword[[''.join(input_selection['Health']),''.join(input_selection['Prep Time']), ''.join(input_selection['Country'])]]
    # df_combined_keyword.drop(index=filter[filter.T.sum()<filter.T.sum().max()].index,inplace=True)

    #TEMP alternative input (To be deleted)
    filter = df_combined_keyword[[''.join(input_selection['Country'])]]
    df_combined_keyword.drop(index=filter[filter.T.sum()<filter.T.sum().max()].index,inplace=True)


    #Select the ingredient table rows that match the keyword table rows after filtering
    df_combined = df_combined_ingredient.loc[df_combined_keyword.index]
    drop_cols=df_combined.iloc[:,29:].sum()==0   #Column 29 and after is the dummy data
    df_combined = df_combined.drop(columns=drop_cols[drop_cols].index,axis=1) #drop all columns that have 0s 
    df_combined.dropna(subset=['AggregatedRating'], inplace=True)
    df_combined.shape


    ##ML

    #training datasets
    y = df_combined['AggregatedRating']
    X = df_combined.drop(columns=df_combined.columns[0:29])

    #training and perforance
    model = LinearRegression()
    model.fit(X, y)
    # print(f"Model's slope: {model.coef_}")
    # print(f"Model's y-intercept: {model.intercept_}")
    # print(f"Model's formula: y = {model.intercept_} + {model.coef_[0]}X")

    # Make predictions using the X set
    predicted_y_values = pd.DataFrame(model.predict(X), columns=['predicted values'])
    # Create a copy of the original data
    df_ingredients_predicted = pd.concat([df_combined['AggregatedRating'].reset_index(),predicted_y_values],axis=1)

    #boxplot x-axis
    df_ingredients_predicted['AggregatedRating'].value_counts().index.sort_values()


    # #Prepping data for boxplot below
    # from numpy import random
    # import matplotlib.pyplot as plt
    # import matplotlib.pyplot as plt
    # import seaborn as sns
    # boxes=[]
    # labels=[]
    # for rating in df_ingredients_predicted['AggregatedRating'].value_counts().index.sort_values():
    #     boxes.append(df_ingredients_predicted[df_ingredients_predicted['AggregatedRating']==rating]['predicted values'])
    #     labels.append(rating)

    # #Plot of predicted Rating based on website input
    # # plt.figure(figsize=(14,3))
    # plt.boxplot(boxes,labels=labels, showbox=True, boxprops={'linestyle':'-', 'linewidth':1, 'color':'brown'}, flierprops={'marker': 'o', 'markersize': 0, 'markeredgecolor': 'red'} , positions=labels)
    # plt.violinplot(boxes, widths=.6, positions=labels)
    # plt.scatter(df_ingredients_predicted['AggregatedRating']+0.2*random.rand(len(df_ingredients_predicted['AggregatedRating']),1).ravel()-.1,
    #             df_ingredients_predicted['predicted values'],marker='o',s=.05,c='r')
    # plt.xticks(rotation=90)
    # plt.yticks(rotation=90)
    # plt.ylabel('Rating')
    # plt.title('Predicted rating based on ingredients')
    # # plt.ylim(3,5)
    # plt.show()


    #Best ingredients you can use given the website input
    best_ingredients = pd.DataFrame({'ingredient': X.columns, 'impact':model.coef_, 'frequency':X.sum()})
    # best_ingredients = best_ingredients.drop(index=best_ingredients[(best_ingredients['impact']>1e3)|(best_ingredients['impact']<-1e3)].index).sort_values(by='impact', ascending=False)
    best_ingredients = best_ingredients.sort_values(by='impact', ascending=False)
    best_ingredients[best_ingredients['frequency']>1].head(10)

    #Worst ingredients you can use given the website input
    best_ingredients[best_ingredients['frequency']>1].tail(10)

    return best_ingredients[best_ingredients['frequency']>10][:10].to_dict(), best_ingredients[best_ingredients['frequency']>10][:10].to_dict()








