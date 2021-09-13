import pandas as pd

df = pd.read_sas('MNH3_Import.sas')

out = df.to_csv('MNH3_Import.csv', index=False)

print(out)