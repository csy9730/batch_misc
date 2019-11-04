# flaskTodo



## todo设计

任务事件分类：
* 时间：
* 地点：
* 大分类：work> study = weekly > relax 
* 动词：
* emotion：个人情感，可以作为附属属性。
* 任务or项目：todo & record
* 状态：计划，执行running，挂起，废弃，完成

语法要素类似：I do something。

### project
如何设计项目系统？

### 动词
以下是动词：
ss： 搜索 github
mgr：管理，或者curd
abs:抽象规律，算法。范式捕捉。总结 ，law。
doc ,编写文档，sop
pdf： 阅读文档。
debug：试图解决困难
plan design code debug test 
think：谋划，原型，策划。
code： 编码
demo:
自己手写: code>>make&build>>run>>debug>>test
源码：download>> code >>build>>run demo>>debug
二进制文件：download>>release>>install>>config>>run>>debug

frp搭建： 
ftp搭建： ss，download&run，debug。
centos的gui： ss,debug.

record：

body： 个人身体状况
shop：强调购买，包括网购和线下购买
move：强调移动交通
dinner：吃饭
meeting：会面
tf：转账

## flask

**Q**:如何允许实现跨域请求
**A**: `resp.headers["Access-Control-Allow-Origin"] = "*"`
### ajax交互
有以下交互方式
* formdata
* json
* xml
* 其他
#### formdata交互方式

``` javascript
    $.ajax({
        url: "/create",
        type: 'post',
        dataType:'json',
        data: dt,
        success: function (data) {
        },
        error:function () {
            console.log("post error");
        }
    })
```
``` python
@app.route("/create", methods=["post", ])
def create():
    dt = { k:v for k,v in request.form.items() }
    resp = Response(json.dumps(dt))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp
```

#### json

``` javascript
    $.ajax({
        url: "/create",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify(dt),
        success: function (data) {
        },
        error:function () {
            console.log("post error");
        }
    })    
```

``` python
@app.route("/create", methods=["post", ])
def create():
    dt = json.loads(request.get_data(as_text=True))  
    resp = Response(json.dumps(dt))
    resp.headers["Access-Control-Allow-Origin"] = "*"
    return resp
```

### todo

**Q**：如何引入智能情景筛选任务列表？
**A**: 实现智能过滤器，通过gps定位和时间。

**Q**:到底是使用dict还是使用object？
**A**: 

**Q**：如何数据库迁移？
**A**:  
1. 关闭程序
2. sql扩充属性，使用默认值或特殊延拓值
3. 后端添加新属性处理
4. 前端添加新属性处理
5. 开启程序

- [ ] 添加verb属性
- [ ] 添加url解析 ajax请求，返回翻页查询列表，filter+sorter+Page
- [ ] 自动备份？
- [x] json to utf-8, ensure_ascii=False
- [x] 修改ajax的text为json格式
- [x] flask添加历史json下载
- [ ] 添加切片历史下载(dateFilter)
- [ ] flask 配置
- [ ] 添加login ！！！
- [ ] 添加数据库，并迁移到数据库 ！！！
- [x] 添加project属性，isProject=False,childList=None,parentProject=None,
- [x] 启用ip 和port配置
- [x] 添加无json文件的默认初始化
- [ ] 
  html端
- [ ] design：实现checkbox批量操作，
- [ ] edit：id和new，pop ，del同一行
- [ ] code：checkbox激活原址编辑。
- [ ] 新增配置界面，引入文件导入（上传）按钮
- [ ] 引入无历史操作
- [x] html表格批量添加添加过期作废按钮！！！
- [x] html添加json下载按钮
- [x] 修改ajax的text为json格式
- [x] ID和Height设为int类型
- [x] 任务树支持一级叶节点，不支持多级叶节点
- [x] filter剔除关闭的project
- [ ] 引入分页显示
- [ ] 通过ipython切割verb和project ！！！
- [ ] name分裂出verb和对象。
- [ ] fix $('#projectCombo').value=0
- [x] 修改newTodo的default原型
- [x] fix post(data) without data bug
- [ ] html填表post不能区分整型和字符串
- [x] input&pop:isProject=False,parentProjectId=0 !!!
- [x] input:update combox::project 
- [x] project Filter,
- [x] heightFilter add Run&suspend
- [x] combox动态crud ,ready to show project
- [x] 表格批量添加checkbox.click()
- [x] 区分 put 和post
- [x] fix idMax 存在bug
- [ ] 添加echart 显示统计图
- [ ] 添加日历显示
- [ ] html添加css 美化表格
- [x] 设计标签tag:work study weekly self relax
- [x] 添加sorter
- [x] 添加filter
- [x] 添加表格显示



