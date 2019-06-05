import 'package:flutter/material.dart';

class FullUse extends StatefulWidget {
  FullUse({Key key}) : super(key: key);

  _FullUseState createState() => _FullUseState();
}

class _FullUseState extends State<FullUse> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.blue);
    return MaterialApp(
        title: 'Statefull基础组件',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Statefull基础组件', style: textStyle),
            leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  title: Text('首页'),
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.orange)),
              BottomNavigationBarItem(
                  title: Text('列表'),
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.orange))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(color: Colors.white),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559645101453&di=96664b329bcf3b19386bdee8217c03c1&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F02%2F15%2F37%2F59ae7d902caa8_610.jpg',
                                width: 100,
                                height: 100,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    hintText: '请输入'),
                              ),
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent),
                                child: PageView(
                                  children: <Widget>[
                                    _item('page1', Colors.red),
                                    _item('page2', Colors.yellow),
                                    _item('page3', Colors.green)
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )
              : Text('text'),
        ));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  _item(String title, MaterialColor color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
