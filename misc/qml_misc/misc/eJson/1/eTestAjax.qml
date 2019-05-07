import QtQuick 2.0
import "ajax.js" as Ajax


/**
测试用ajax 获取 json 数据
更复杂的ajax调用请查看 qml/network/ 相关示例
*/
Grid{
    width: 600
    height: 400
    spacing: 10
    columns: 2

    Text {text: 'city:'}
    Text {id:city; text:' '}

    Text {text: 'date:'}
    Text {id:date; text:' '}

    Text {text: 'temp:'}
    Text {id:temp1; text:' '}

    Component.onCompleted: {
        // 中国天气网实况天气接口（可用）
        Ajax.get("http://www.weather.com.cn/data/sk/101280101.html",
            function(result, json){
                city.text = json.weatherinfo.city;
                date.text = json.weatherinfo.time;
                temp1.text = json.weatherinfo.temp;
            }
        );

        /*
        // 中华万年历的当天及预告天气接口（可用）
        Ajax.get("http://wthrcdn.etouch.cn/weather_mini?city=%E5%8C%97%E4%BA%AC",
            function(result, json){
                city.text = json.data.city;
                date.text = json.data.forecast[0].date;
                temp1.text = json.data.wendu;
            }
        );
        */

        /*
        // 中国天气网当天及预告天气接口（接口挂了）
        Ajax.get("http://m.weather.com.cn/data/101010100.html",
            function(result, json){
                city.text = json.weatherinfo.city;
                date.text = json.weatherinfo.date_y;
                temp1.text = json.weatherinfo.temp1;
            }
        );
        */
    }
}
