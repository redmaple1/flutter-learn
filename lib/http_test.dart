import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/ClockInRes.dart';

class HttpTest extends StatefulWidget {
  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {

  _clockIn() async {
    var data = {
      'longitude': 116.4650751341954,
      'latitude': 40.011054265271525,
      'accuracy': 65,
      'timestamp': 1565010097303,
      'signature': 'nNQbYivjvkuCJ7VbCsGYCZOIV/4=',
      'macAddr': ''
    };
    
    var url = 'https://e.xinrenxinshi.com/attendance/ajax-sign';

    try {
      var httpClient = new HttpClient();
//      httpClient.findProxy = (url) {
//        return 'PROXY 192.168.226.214:8888';
////        return HttpClient.findProxyFromEnvironment(url, environment: {"http_proxy": 'http://192.168.226.214:8888',});
//      };

      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.add('Accept', 'application/json, text/plain, */*');
      request.headers.add('Accept-Language', 'zh-cn');
      request.headers.add('Content-Type', 'application/json;charset=UTF-8');
      request.headers.add('Host', 'e.xinrenxinshi.com');
      request.headers.add('Origin', 'https://e.xinrenxinshi.com');
      request.headers.add('Referer', 'https://e.xinrenxinshi.com/');
      request.headers.add('User-Agent',
          'Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 wxwork/2.8.6 MicroMessenger/7.0.1 Language/zh');
      request.headers.add('X-CSRF-TOKEN',
          'OGZjZTU0MGINBABUUA0BAFkDWwQBBVQHAFcCAQ1SAAEKXgYAVA0BVg==');
      request.headers.add('Cookie',
          'sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%22832ea56eae8e4c95b2f181e4f57671ad%22%2C%22%24device_id%22%3A%22169d6cad9de3f5-087aa676bb1a3d8-6c0d6053-304500-169d6cad9df10aa%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_referrer%22%3A%22%22%2C%22%24latest_referrer_host%22%3A%22%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%7D%2C%22first_id%22%3A%22169d6cad9de3f5-087aa676bb1a3d8-6c0d6053-304500-169d6cad9df10aa%22%7D; sa_jssdk_2015_e=%7B%22distinct_id%22%3A%22832ea56eae8e4c95b2f181e4f57671ad%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_referrer%22%3A%22%22%2C%22%24latest_referrer_host%22%3A%22%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%7D%2C%22first_id%22%3A%2216be100f07b84c-0158cac6543dec8-6e010158-304500-16be100f07c112d%22%7D; QJYDSID=a32babecca4e4c249ab75abe86f79e3a');

      request.add(utf8.encode(json.encode(data)));

      HttpClientResponse response = await request.close();

      String _text = await response.transform(utf8.decoder).join();

      Map<String, dynamic> resJson = json.decode(_text);
      ClockInRes res = ClockInRes.fromJson(resJson);

      if (res.code == 0) {
        print(res.data.msg);
        showMyMaterialDialog(context, '成功', res.data.msg);
      } else {
        print(res.data.msg);
        showMyMaterialDialog(context, "失败", "哎呀，失败了");
      }

      httpClient.close();
    } catch (e) {
      showMyMaterialDialog(context, "失败", "哎呀，发生错误了");
      print("error $e");
    }
  }

//  _test() {
//    String resStr =
//        '{"code": 0,"message": "打卡成功", "status": true, "data": {"parentDeps": "625fe64723ca4f3fa9f3b077c4aaf44d,17ea549e2cf94ddfa5fc97be39408adc,a52a4acfae9d45d9bace65a6a1e45f66,3d02366c7783455cb8549ead86685074","date": 1565058516964,"msg": "打卡时间为10:28"}}';
//    Map<String, dynamic> resJson = json.decode(resStr);
//    ClockInRes res = ClockInRes.fromJson(resJson);
//    print(res.data.msg);
//    print('test button');
//    showMyMaterialDialog(context, '成功', res.data.msg);
//  }

  void showMyMaterialDialog(
      BuildContext context, String title, String mainText) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("$title"),
            content: new Text("$mainText"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("知道了"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('这是一个神奇的App'),
        ),
        body: Container(
          child: ButtonTheme(
            minWidth: 200,
            height: 100,
            child: RaisedButton(
              onPressed: _clockIn,
              color: Colors.blueAccent,
              textColor: Colors.white,
              highlightColor: Colors.lightBlueAccent,
              child: Text(
                '点我',
                style: TextStyle(fontSize: 20),
              ),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          alignment: Alignment.center,
        ));
  }
}
