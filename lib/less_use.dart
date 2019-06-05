import 'package:flutter/material.dart';

class LessUse extends StatelessWidget {
  const LessUse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.blue, fontSize: 30);
    return MaterialApp(
      title: 'Stateless基础组件',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                '这是一行文本',
                style: textStyle,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                label: Text('chip组件'),
                avatar: Icon(Icons.people),
              ),
              Card(
                  color: Colors.blue,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Container(
                      padding: EdgeInsets.all(10), child: Text('卡片文字'))),
              AlertDialog(
                title: Text('通知'),
                content: Text('注意啦'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
