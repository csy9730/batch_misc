#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/6/5
import os,sys
import json
# 导入模块
from flask import  Flask,render_template,url_for
from flask import request
from flask import Response
from flask import send_file
from addAttr import jobList

#创建实例化请求对象
app = Flask(__name__)
cJob = jobList()

# 定义路由
# 路由对应的函数处理
@app.route("/")
def index():
	# 响应数据
	resp = Response("<h2>首页</h2>")
	print( url_for('static', filename='style.css'))
	# 允许所有跨域访问
	resp.headers["Access-Control-Allow-Origin"] = "*"
	return app.send_static_file('index.html')#homepage.html在static文件夹下
	return render_template('index.html')
	# return resp

# with app.test_request_context():
# 	print( url_for('static', filename='style.css'))
@app.route('/item/<id>/')
def item(id):
    return 'Item:{}'.format(id)
    
@app.route("/course")
def courses():
    load_dict = cJob.getList()
    # print(load_dict)
    resp = Response(json.dumps(load_dict))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp
@app.route("/download/<filename>")    
def downloadTodo(filename):
    if filename=="todo":      
        file_name = cJob.filename
    elif filename == "history":
        file_name = cJob.historyname
    else:
        return
    return send_file(f'{file_name}', mimetype='text/json',attachment_filename=f'{file_name}', as_attachment=True)
@app.route("/history")
def history():
    load_dict = cJob.getHistoryList()
    # print(load_dict)
    resp = Response(json.dumps(load_dict))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp

# 前端发送ajax动态页面post,put请求,对应set&new
# 定义路由
@app.route("/create", methods=["post", ])
def create():
    # print(request.form.get('Id'),request.form,type(request.form))
    # print( request.values)
    dt = json.loads(request.get_data(as_text=True))  
    # dt = json.loads( request.form)
    # keys = ["Id","Name","Datetime","Tag","Height","Txt","Misc","IsProject","ParentProject"]
    # dt = {k: request.form.get(k) for k in keys}
    # dt = { k:v for k,v in request.form.items() }
    print(dt)
    data = cJob.setObj(dt)
    # 再次返回最新的数据 响应会前端
    resp = Response(json.dumps(data))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp


# 前端发送post请求
# 定义路由
@app.route("/delete", methods=["post", ])
def delete():
    print(request.form.get('Name'))
    # 再次返回最新的数据 响应会前端
    resp = Response(json.dumps(data))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp

if __name__ == '__main__':
    load_dict =  [{
            "Id":"3",
            "Name": "小明1",
            "Datetime": "6",
            "Tag": "weekly",
            "Height": "60",
            "Txt":"",
            "Misc":"",        
        },{
            "Id":"5",
            "Name": "小红",
            "Datetime": "8",
            "Tag": "study",
            "Height": "80",
            "Txt":"",
            "Misc":"",       
        }]
    import argparse
    parser = argparse.ArgumentParser(description="run flask app")            # description参数可以用于插入描述脚本用途的信息，可以为空
    parser.add_argument('--ipaddr','-i', action="store",dest="host",help = """input ip address,if host is localhost,only machine self can connect;
    if host is 0.0.0.0 ,every local machine can connect to host """)
    parser.add_argument('--port','-p',type =int, action='store',default=8800,help = ' input port number ')
    # parser.add_argument('--debug','-d',type =bool, action='store',help = 'input debug')
    args = parser.parse_args()
    # import socket
    # mac_name = socket.getfqdn(socket.gethostname(  ))
    # mac_addr = socket.gethostbyname(mac_name)

    dct = vars(args)
    print(dct)
    app.run(**dct )