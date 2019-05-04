var saveAs = require('../js/FileSaver.min');
var students = [{
        "name": "小明1",
        "age": "6",
        "sex": "男",
        "height": "60"
    }, {
        "name": "小明2",
        "age": "7",
        "sex": "男",
        "height": "70"
    }, {
        "name": "小明3",
        "age": "8",
        "sex": "男",
        "height": "80"
    }];
    // 导出生成json文件
    function downloadJson(data) {
        var blob = new Blob([JSON.stringify(data)], { type: "" });
        saveAs(blob, "hello.json");
    }
    // 导出生成文本
    function downloadText(data) {
        var blob = new Blob([JSON.stringify(data)], { type: "text/plain;charset=utf-8" });
        saveAs(blob, "hello.txt");
    }