#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/6/5

import json
# 导入模块
from flask import  Flask,render_template,url_for
from flask import request
from flask import Response

#创建实例化请求对象
app = Flask(__name__)

# print( url_for('static', filename='style.css'))
# 定义路由
@app.route("/")
# 路由对应的函数处理
def index():
	# 响应数据
	resp = Response("<h2>首页</h2>")
	print( url_for('static', filename='style.css'))
	# 允许所有跨域访问
	resp.headers["Access-Control-Allow-Origin"] = "*"
	return app.send_static_file('index.html')#homepage.html在static文件夹下
	return render_template('index.html')
	# return resp

with app.test_request_context():
	print( url_for('static', filename='style.css'))
@app.route("/course")
def courses():
    # 业务逻辑
    load_dict = {
        "name": 'alex'
    }
    with open("user.json", "r") as f:
        load_dict = json.load(f)
    print(load_dict)
    # 返回json序列化的数据
    resp = Response(json.dumps(load_dict))
    resp.headers["Access-Control-Allow-Origin"] = "*"

    return resp

# 前端发送post请求
# 定义路由
@app.route("/create", methods=["post", ])
def create():
    print(request.form.get('name'))
    # 读取user.json中的原始的数据
    with open("user.json", "r") as f:
        # 将数据反序列化
        data = json.loads(f.read())

    # 将新数据添加到原始的数据中
    data.append({"name": request.form.get('name')})

    # 将此时最新的数据再次写入文件中
    with open("user.json", "w") as f:
        f.write(json.dumps(data))

    # 再次返回最新的数据 响应会前端
    resp = Response(json.dumps(data))

    resp.headers["Access-Control-Allow-Origin"] = "*"

    return resp


if __name__ == '__main__':

    app.run(host="localhost", port=8800, )