import pandas as pd
from pathlib import Path

def load_table():

    #load files
    df_ingredient=pd.read_csv('./data/dummies/ingredient_dummy.csv')
    df_keyword=pd.read_csv('./data/dummies/keyword_dummy.csv')
    return df_ingredient, df_keyword