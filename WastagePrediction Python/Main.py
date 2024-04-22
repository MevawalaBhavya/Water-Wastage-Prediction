import json
from json import JSONEncoder

import numpy
import pandas as pd
import pymysql
from flask import Flask, request, jsonify
from flask_cors import CORS

from Test import *

warnings.filterwarnings("ignore", category=FutureWarning)
warnings.filterwarnings("ignore", category=DeprecationWarning)
app = Flask(__name__)
cors = CORS(app)


class NumpyArrayEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, numpy.ndarray):
            return obj.tolist()
        return JSONEncoder.default(self, obj)


@app.route('/admin/getData', methods=['get'])
def adminGetData():
    typeOfPrediction = request.args.get('predictionType')
    if typeOfPrediction == 'usage':
        Date = request.args.get('dateOfWater')
        Supply = int(request.args.get('supply'))
        ZoneId = int(request.args.get('zoneId'))
        WardId = int(request.args.get('wardId'))
        Population = int(request.args.get('population'))

        print('Data:::', Date, Supply, ZoneId, WardId, Population)
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='root',
                                     db='waterwastage')

        cursor1 = connection.cursor()

        cursor1.execute('select * from zone_tbl where Id={}'.format(ZoneId))

        zoneData = cursor1.fetchall()
        ZoneName = zoneData[0][2]
        cursor1.execute('select * from ward_tbl where Id={}'.format(WardId))

        wardData = cursor1.fetchall()
        WardName = wardData[0][3]

        columnValue = [Date, Supply, ZoneName, WardName, Population]
        columnName = ['Date', 'Supply', 'Zone', 'Ward', 'Population']

        df = pd.DataFrame([columnValue], columns=columnName)

        prediction = waterUsagePrediction(df)
        print('prediction>>>>', prediction, type(prediction))

        waterUsage = (prediction.tolist())[0]

        response_list = json.dumps(prediction, cls=NumpyArrayEncoder)
        print('response_list>>>>', response_list, type(response_list))

        statement = "Insert into wastageprediction_tbl(dateOfWater,population,predectionType,supply,usagePrediction,wardId,zoneId) VALUES(%s,%s,%s,%s,%s,%s,%s)"

        value = (Date, Population, typeOfPrediction, Supply, waterUsage, WardId, ZoneId)

        cursor1.execute(statement, value)

        connection.commit()
        cursor1.close()
        connection.close()

        response_dict = {'WaterUsage': response_list}
        print('response_dict>>>>', response_dict, type(response_dict))

        response = jsonify(response_dict)
        print('response>>>>', response, type(response))

        response.headers.add('Access-Control-Allow-Origin', '*')

        return response

    else:
        Date = request.args.get('dateOfWater')
        Supply = int(request.args.get('supply'))
        ZoneId = int(request.args.get('zoneId'))
        WardId = int(request.args.get('wardId'))
        Population = int(request.args.get('population'))
        Usage = float(request.args.get('usage'))

        print('Data:::', Date, Supply, ZoneId, WardId, Population, Usage)
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='root',
                                     db='waterwastage')

        cursor1 = connection.cursor()

        cursor1.execute('select * from zone_tbl where Id={}'.format(ZoneId))

        zoneData = cursor1.fetchall()
        ZoneName = zoneData[0][2]
        cursor1.execute('select * from ward_tbl where Id={}'.format(WardId))

        wardData = cursor1.fetchall()
        WardName = wardData[0][3]

        columnValue = [Date, Supply, ZoneName, WardName, Population, Usage]
        columnName = ['Date', 'Supply', 'Zone', 'Ward', 'Population', 'Usage']

        df = pd.DataFrame([columnValue], columns=columnName)

        prediction = waterWastagePrediction(df)
        print('prediction>>>>', prediction, type(prediction))

        waterWastage = (prediction.tolist())[0]

        response_list = json.dumps(prediction, cls=NumpyArrayEncoder)
        print('response_list>>>>', response_list, type(response_list))

        statement = "Insert into wastageprediction_tbl(dateOfWater,population,predectionType,supply,usagePrediction,wastagePrediction,wardId,zoneId) VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"

        value = (Date, Population, typeOfPrediction, Supply, Usage, waterWastage, WardId, ZoneId)

        cursor1.execute(statement, value)

        connection.commit()
        cursor1.close()
        connection.close()

        response_dict = {'WaterWastage': response_list}
        print('response_dict>>>>', response_dict, type(response_dict))

        response = jsonify(response_dict)
        print('response>>>>', response, type(response))

        response.headers.add('Access-Control-Allow-Origin', '*')

        return response


@app.route('/user/getData', methods=['get'])
def userGetData():
    typeOfPrediction = request.args.get('predictionType')
    if typeOfPrediction == 'usage':
        Date = request.args.get('dateOfWater')
        Supply = int(request.args.get('supply'))
        ZoneId = int(request.args.get('zoneId'))
        WardId = int(request.args.get('wardId'))
        Population = int(request.args.get('population'))

        print('Data:::', Date, Supply, ZoneId, WardId, Population)
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='root',
                                     db='waterwastage')

        cursor1 = connection.cursor()

        cursor1.execute('select * from zone_tbl where Id={}'.format(ZoneId))

        zoneData = cursor1.fetchall()
        ZoneName = zoneData[0][2]
        cursor1.execute('select * from ward_tbl where Id={}'.format(WardId))

        wardData = cursor1.fetchall()
        WardName = wardData[0][3]

        connection.commit()
        cursor1.close()
        connection.close()

        columnValue = [Date, Supply, ZoneName, WardName, Population]
        columnName = ['Date', 'Supply', 'Zone', 'Ward', 'Population']

        df = pd.DataFrame([columnValue], columns=columnName)

        prediction = waterUsagePrediction(df)
        print('prediction>>>>', prediction, type(prediction))

        response_list = json.dumps(prediction, cls=NumpyArrayEncoder)
        print('response_list>>>>', response_list, type(response_list))

        response_dict = {'WaterUsage': response_list}
        print('response_dict>>>>', response_dict, type(response_dict))

        response = jsonify(response_dict)
        print('response>>>>', response, type(response))

        response.headers.add('Access-Control-Allow-Origin', '*')

        return response

    else:
        Date = request.args.get('dateOfWater')
        Supply = int(request.args.get('supply'))
        ZoneId = int(request.args.get('zoneId'))
        WardId = int(request.args.get('wardId'))
        Population = int(request.args.get('population'))
        Usage = float(request.args.get('usage'))

        print('Data:::', Date, Supply, ZoneId, WardId, Population, Usage)
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='root',
                                     db='waterwastage')

        cursor1 = connection.cursor()

        cursor1.execute('select * from zone_tbl where Id={}'.format(ZoneId))

        zoneData = cursor1.fetchall()
        ZoneName = zoneData[0][2]
        cursor1.execute('select * from ward_tbl where Id={}'.format(WardId))

        wardData = cursor1.fetchall()
        WardName = wardData[0][3]

        connection.commit()
        cursor1.close()
        connection.close()

        columnValue = [Date, Supply, ZoneName, WardName, Population, Usage]
        columnName = ['Date', 'Supply', 'Zone', 'Ward', 'Population', 'Usage']

        df = pd.DataFrame([columnValue], columns=columnName)

        prediction = waterWastagePrediction(df)
        print('prediction>>>>', prediction, type(prediction))

        response_list = json.dumps(prediction, cls=NumpyArrayEncoder)
        print('response_list>>>>', response_list, type(response_list))

        response_dict = {'WaterWastage': response_list}
        print('response_dict>>>>', response_dict, type(response_dict))

        response = jsonify(response_dict)
        print('response>>>>', response, type(response))

        response.headers.add('Access-Control-Allow-Origin', '*')

        return response


app.run(port=2020, threaded=True)
