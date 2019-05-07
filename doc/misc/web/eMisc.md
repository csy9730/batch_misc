# web 

网页处理分为服务器端和客户端。服务器端处理客户端请求是程序实例(app).客户端的浏览器通过接受数据，本地渲染生成网页

## 网页
### 静态文件

### 模板
模板是一个包含响应文本的文件，其中包含用占位变量表示的动态部分，其具体值只在请
求的上下文中才能知道。使用真实值替换变量，再返回最终得到的响应字符串，这一过程
称为渲染。为了渲染模板，

## route

程序实例需要知道url和对应python函数执行，对应关系称为路由(route)。
http://127.0.0.1:5000/


###动态路由
```python
@app.route('/user/<name>')
    def user(name):
    return '<h1>Hello, %s!</h1>' %name
```
视图函数(view)，基于route不同，返回不同的html文件或html字符串。

### 重定向
网页跳转：重定向。
#### 自定义错误页面

###服务器启动
服务器启动后，会进入轮询，等待并处理请求。轮询会一直运行，直到程序停止，比如按
Ctrl-C键。可以随时更改服务器端所有文件，稍后更新网页端
### GET，POST
GET用于查询，POST用于上传数据。
GET查询会添加明文字符串到url尾部，安全性差。

#### 登陆
 登陆or注册，注册成功 ，登陆，登陆成功，其他操作。<验证码>
### POST填表
通过flask_wtf动态生成表格，通过点击submit按钮触发POST事件，通过判断validate_on_submit()，改变视图。

如何区分不同按钮提交的多态，添加不同判断。
用post请求处理URL时，我们会遇到一个问题：post请求通常会发送一个表单，或者JSON，它作为request的body发送

## 数据库

```


## misc

### configure

### mail
邮件发送
bug：
设置邮箱163端口
设置邮箱授权码为password
设置bat变量，注意无双引号
