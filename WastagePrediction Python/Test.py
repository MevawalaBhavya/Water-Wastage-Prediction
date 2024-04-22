import warnings

from sklearn.externals import joblib
from sklearn.preprocessing import LabelEncoder

warnings.filterwarnings('ignore')


def dataPreprocessing(df, columnName):
    le = LabelEncoder()

    le.fit(df[columnName])

    df[columnName] = le.transform(df[columnName])


def waterUsagePrediction(df):
    model = joblib.load('Usage_Model.sav')

    dataPreprocessing(df, 'Date')
    dataPreprocessing(df, 'Zone')
    dataPreprocessing(df, 'Ward')

    X_test = df[['Date', 'Supply', 'Zone', 'Ward', 'Population']]

    X_test = X_test.as_matrix()
    print('X_test>>>>', type(X_test))

    prediction = model.predict(X_test)

    return prediction


def waterWastagePrediction(df):
    model_dump = joblib.load('Wastage_Model.sav')

    dataPreprocessing(df, 'Date')
    dataPreprocessing(df, 'Zone')
    dataPreprocessing(df, 'Ward')

    X_test = df[['Date', 'Supply', 'Zone', 'Ward', 'Population', 'Usage']]

    X_test = X_test.as_matrix()
    print(type(X_test))

    prediction = model_dump.predict(X_test)

    return prediction
