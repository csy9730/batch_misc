//require��ʾ�������������������Լ���һ�����⹦��
var http = require("http");
//������������������һ���ص���������ʾ��������������Ҫ��ʲô
var server = http.createServer(function(req,res){
    //req��ʾ����request;  res��ʾ��Ӧ��response
    //����HTTPͷ����״̬����200���ļ�������html���ַ�����utf8
    res.writeHead(200,{"Content-type":"text/html;charset=UTF-8"});
    res.end("hello,world!");
});

//���з�����������3000�˿ڣ��˿ںſ����θģ�
server.listen(3000,"127.0.0.1");
console.log('Server running at http://127.0.0.1:3000/');