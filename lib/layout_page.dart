import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key}) : super(key: key);

  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _currentIndex = 0;
  String imageSrc =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559645101453&di=96664b329bcf3b19386bdee8217c03c1&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F02%2F15%2F37%2F59ae7d902caa8_610.jpg';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter layout',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
          appBar: AppBar(
            title: Text('flutter layout'),
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
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(imageSrc),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Image.network(
                                          imageSrc,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Image.network(
                                imageSrc,
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
                                  margin: EdgeInsets.all(10),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: PhysicalModel(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.antiAlias,
                                    child: PageView(
                                      children: <Widget>[
                                        _item('page1', Colors.red),
                                        _item('page2', Colors.yellow),
                                        _item('page3', Colors.green)
                                      ],
                                    ),
                                  )),
                              Column(
                                children: <Widget>[
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.green),
                                      child: Text('宽度撑满'),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      Stack(
                        children: <Widget>[
                          Image.network(
                            imageSrc,
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              imageSrc,
                              width: 36,
                              height: 36,
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          _chip('钢铁侠'),
                          _chip('美国队长'),
                          _chip('黑寡妇'),
                          _chip('绿巨人'),
                          _chip('鹰眼')
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )
              : Column(
                  children: <Widget>[
                    Text('列表'),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        child: Text('拉伸填满高度'),
                      ),
                    )
                  ],
                ),
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

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: Text(label.substring(0, 1)),
        ));
  }
}
