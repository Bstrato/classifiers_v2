import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

import phik
from phik import resources
from phik.binning import bin_data
from phik.report import plot_correlation_matrix

data = pd.read_csv('vaccine_visit.csv')

#print(data)

#cor=data.phik_matrix()
cor=data.phik_matrix()

plot_correlation_matrix(cor.values, x_labels=cor.columns, y_labels=cor.index,
                        vmin=0, vmax=1, color_map='Blues', title=r'Feature_Correlation_Matrix', fontsize_factor=1.0,
                        figsize=(11, 8.27))

plt.tight_layout()

plt.show()



#print(cor)