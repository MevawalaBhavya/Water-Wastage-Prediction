import pandas as pd
import numpy as np
import warnings
import scipy.stats as st
import seaborn as sns  # Seaborn, useful for graphics
from sklearn.externals import joblib
from sklearn.metrics import mean_absolute_error, accuracy_score
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.preprocessing import LabelEncoder
from xgboost.sklearn import XGBRegressor

warnings.filterwarnings('ignore')

rc = {'lines.linewidth': 2,
      'axes.labelsize': 18,
      'axes.titlesize': 18,
      'axes.facecolor': 'DFDFE5'}

sns.set_context('notebook', rc=rc)
sns.set_style('darkgrid', rc=rc)


def dataPreprocessing(columnName):
    le = LabelEncoder()

    le.fit(dataframe[columnName])

    dataframe[columnName] = le.transform(dataframe[columnName])


print('-------------------  read csv file from training dataset -------------------')
dataframe = pd.read_excel('DatasetFinal.xlsx')
# print(dataframe)

# dataframe = dataframe.drop(['Usage'], axis=1)
# print(dataframe)


dataPreprocessing('Date')
dataPreprocessing('Zone')
dataPreprocessing('Ward')

independent_X = dataframe[['Date', 'Supply', 'Zone', 'Ward', 'Population', 'Usage']]
dependent_y = dataframe['Wastage'].astype(int)

print('independent_X', independent_X)
print('dependent_y', dependent_y)

# print("------------------Split data for training & testing_________________________")
X_train, X_test, y_train, y_test = train_test_split(independent_X, dependent_y, test_size=0.30)

X_train = X_train.as_matrix()
X_test = X_test.as_matrix()
y_train = np.array(y_train.reshape(-1, 1))
y_test = np.array(y_test.reshape(-1, 1))

print("X_train=", X_train.shape)
print("y_train=", y_train.shape)
print("X_test=", X_test.shape)
print("y_test=", y_test.shape)

one_to_left = st.beta(10, 1)

from_zero_positive = st.expon(0, 50)

params = {
    "n_estimators": st.randint(3, 40),
    "max_depth": st.randint(3, 40),
    "learning_rate": st.uniform(0.01, 0.4),
    "colsample_bytree": one_to_left,
    "subsample": one_to_left,
    "gamma": st.uniform(0, 10),
    'reg_alpha': from_zero_positive,
    "min_child_weight": from_zero_positive
}

xgbreg = XGBRegressor(nthread=-1)
rsCV = RandomizedSearchCV(xgbreg, params, n_jobs=10)

rsCV.fit(X_train, y_train)

clf = XGBRegressor(**rsCV.best_params_)
clf.fit(X_train, y_train)

joblib.dump(clf, "Wastage_Model.sav")

prediction = clf.predict(X_test)
print(prediction)
print("MAE: %.4f" % mean_absolute_error(y_test, prediction))

result = clf.score(X_test, y_test)

print('Score::', result)
