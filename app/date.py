#!/usr/bin/env python3

from flask import Flask
import datetime
app = Flask(__name__)

@app.route('/')
def index():
    return 'Flask is running!'

@app.route('/hello')
def display():
    time = str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return f"Current date and time: {time}"

if __name__=='__main__':
    app.run(host='0.0.0.0', port=3000)
