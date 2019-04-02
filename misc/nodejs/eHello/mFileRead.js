const fs = require('fs');
fs.writeFileSync('./message2.txt','这是第一行');
//同步方法
var data = fs.readFileSync('./message2.txt', 'utf8');
console.log(data);
//异步方法
fs.writeFile('./message.txt', '这是第一行',function(err){
    if(err) console.log('写文件操作失败');
    else console.log('写文件操作成功');
});
fs.readFile('./message.txt', 'utf8', function(err, data){
    console.log(data);  
});
