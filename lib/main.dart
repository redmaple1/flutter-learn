import 'package:flutter/material.dart';
import 'package:myapp/full_use.dart';
import 'package:myapp/http_test_wjh.dart';
import 'package:myapp/layout_page.dart';
import 'package:myapp/logo_app.dart';
import 'package:myapp/photo_hero_page.dart';

import 'http_test.dart';
import 'image_app_page.dart';
import 'less_use.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HttpTestWjh(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('flutter使用路由'),
//        ),
//        body: RouteNavigator(),
//      ),
//      routes: <String, WidgetBuilder>{
//        'less': (BuildContext context) => LessUse(),
//        'full': (BuildContext context) => FullUse(),
//        'layout': (BuildContext context) => LayoutPage(),
//        'image': (BuildContext context) => ImageAppPage()
//      },
    );
  }
}

//class RouteNavigator extends StatefulWidget {
//  @override
//  _RouteNavigatorState createState() => _RouteNavigatorState();
//}
//
//class _RouteNavigatorState extends State<RouteNavigator> {
//  bool byName = false;
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          SwitchListTile(
//            value: byName,
//            title: Text('${byName ? '' : '不'}使用路由名跳转'),
//            onChanged: (value) {
//              setState(() {
//                byName = value;
//              });
//            },
//          ),
//          _item('Stateless基础组件', LessUse(), 'less'),
//          _item('Statefull基础组件', FullUse(), 'full'),
//          _item('Flutter layout', LayoutPage(), 'layout'),
//          _item('拍照app', ImageAppPage(), 'image'),
//        ],
//      ),
//    );
//  }
//
//  _item(String title, page, String routeName) {
//    return Container(
//      child: RaisedButton(
//        onPressed: () {
//          if (byName) {
//            Navigator.pushNamed(context, routeName);
//          }else{
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
//          }
//        },
//        child: Text(title),
//      ),
//    );
//  }
//}
