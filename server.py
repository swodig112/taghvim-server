from datetime import datetime
import numpy as np
import csv
import pandas as pd
from flask import Flask
from flask import request
from flask_cors import CORS
from constants import *


app = Flask(__name__)
from werkzeug.middleware.proxy_fix import ProxyFix
app.wsgi_app = ProxyFix(
    app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_prefix=1
)
DF  = np.load("combined.npy", mmap_mode="r")
CORS(app)

@app.route("/", methods=['POST'])
def home():
    # print(request.json)
    # for i in request.form:
        # print(i)
    # return get_data(request.json)
    data = request.json
    time = date_time_to_secs(data)
    xyz = np.array(DF[get_entry_index_by_date(time)])
    idx = int(data['objectName'])
    r = xyz[idx*6:(idx+1)*6]
    v = r[1::2]
    r = r[0::2]
    re = xyz[2*6:3*6]
    re = re[0::2]
    r, v = convert_to_metric(r, v)
    if idx != 2:
        alfa, delta = convert_earth(r, re)
    else:
        alfa, delta = None, None
    return {"rightAscension": alfa,
            "declination": delta,
            "position": r.tolist(),
            "velocity": v.tolist()}

def read_line(filename, linenumber):
    try:
        with open(filename, newline='') as csvfile:
            lines = csv.reader(csvfile)
            for i, data in enumerate(lines):
                if i == linenumber:
                    return list(map(float, data))
        raise ValueError(f"Line number {linenumber} is out of range in file {filename}")
    except FileNotFoundError:
        raise FileNotFoundError(f"File {filename} doesn't exist")
        
    return None

def load_data(filename):
    df = pd.read_csv(filename,header=None,names=NAMES)
    df.loc[:,'vz_sun']=0
    return df
    
def convert_to_metric(r,v):
    r *= AU
    v *= AU / P0
    return r, v

def convert_earth(r, re):
    r -= re
    R  = np.dot(r,r)
    delta = np.asin(r[2]/R)
    alfa = np.atan2(r[1], r[0])# + 2 * np.pi
    return np.degrees(alfa), np.degrees(delta)
 
def mix_csvs(files):
    df = load_data(files[0])[:-1]
    for file in files[1:-1]:
        df = pd.concat((df, load_data(file)[:-1]))
    df = pd.concat((df, load_data(files[-1])))
    return df

def get_entry_index_by_date(date):
    return int((date - HIST0) / (31536 / 3))

def date_time_to_secs(data):
    date = data['date']
    time = data['time']
    return datetime.strptime(date + ' ' + time, '%Y-%m-%d %H:%M').timestamp()
