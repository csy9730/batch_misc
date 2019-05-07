import QtQuick 2.0
import "ajax.js" as Ajax


/**
������ajax ��ȡ json ����
�����ӵ�ajax������鿴 qml/network/ ���ʾ��
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
        // �й�������ʵ�������ӿڣ����ã�
        Ajax.get("http://www.weather.com.cn/data/sk/101280101.html",
            function(result, json){
                city.text = json.weatherinfo.city;
                date.text = json.weatherinfo.time;
                temp1.text = json.weatherinfo.temp;
            }
        );

        /*
        // �л��������ĵ��켰Ԥ�������ӿڣ����ã�
        Ajax.get("http://wthrcdn.etouch.cn/weather_mini?city=%E5%8C%97%E4%BA%AC",
            function(result, json){
                city.text = json.data.city;
                date.text = json.data.forecast[0].date;
                temp1.text = json.data.wendu;
            }
        );
        */

        /*
        // �й����������켰Ԥ�������ӿڣ��ӿڹ��ˣ�
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
