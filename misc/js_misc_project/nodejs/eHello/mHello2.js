//require��ʾ�������������������Լ���һ�����⹦��
var http = require("http");
var fs = require("fs");

//������������������һ���ص���������ʾ��������������Ҫ��ʲô
var server = http.createServer(function(req,res){
    if(req.url == "/fang"){
        fs.readFile("./test/xixi.html",function(err,data){
            //req��ʾ����request;  res��ʾ��Ӧ��response
            //����HTTPͷ����״̬����200���ļ�������html���ַ�����utf8
            res.writeHead(200,{"Content-type":"text/html;charset=UTF-8"});
            res.end(data);
        });
    }else if(req.url == "/yuan"){
        fs.readFile("./test/haha.html",function(err,data){
            //req��ʾ����request;  res��ʾ��Ӧ��response
            //����HTTPͷ����״̬����200���ļ�������html���ַ�����utf8
            res.writeHead(200,{"Content-type":"text/html;charset=UTF-8"});
            res.end(data);
        });
    }else if(req.url == "/1.jpg"){
        fs.readFile("./test/0.jpg",function(err,data){
            //req��ʾ����request;  res��ʾ��Ӧ��response
            //����HTTPͷ����״̬����200���ļ�������html���ַ�����utf8
            res.writeHead(200,{"Content-type":"image/jpg"});
            res.end(data);
        });
    }else if(req.url == "/bbbbbb.css"){
        fs.readFile("./test/aaaaaa.css",function(err,data){
            //req��ʾ����request;  res��ʾ��Ӧ��response
            //����HTTPͷ����״̬����200���ļ�������html���ַ�����utf8
            res.writeHead(200,{"Content-type":"text/css"});
            res.end(data);
        });
    }else{
        res.writeHead(404,{"Content-type":"text/html;charset=UTF-8"});
        res.end("û�����ҳ����");
    }
});

//���з�����������3000�˿ڣ��˿ںſ����θģ�
server.listen(3000,"127.0.0.1");