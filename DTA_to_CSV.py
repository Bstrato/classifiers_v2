import pandas as pd


def con_dta_to_csv(data, out):
    data = pd.read_stata('GHKR72FL.DTA', convert_categoricals=False, convert_missing=True)
    out =data.to_csv('Function_GH2.csv')
    return out

con_dta_to_csv('out')