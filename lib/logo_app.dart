import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  LogoApp({Key key}) : super(key: key);

  _LogoAppState createState() => _LogoAppState();
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  // AnimationStatus animationStatus;
  // double animationValue;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
      // ..addListener(() {
      //   //动画的值变化时被调用
      //   setState(() {
      //     animationValue = animation.value;
      //   });
      // })
      // ..addStatusListener((AnimationStatus status) {
      //   //动画状态发生变化时被调用
      //   animationStatus = status;
      // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
    // return Container(
    //   margin: EdgeInsets.only(top: 50),
    //   child: Column(
    //     children: <Widget>[
    //       GestureDetector(
    //         onTap: () {
    //           controller.reset();
    //           controller.forward();
    //         },
    //         child: Text(
    //           'start',
    //           textDirection: TextDirection.ltr,
    //         ),
    //       ),
    //       Text(
    //         'status:' + animationStatus.toString(),
    //         textDirection: TextDirection.ltr,
    //       ),
    //       Text(
    //         'value:' + animationValue.toString(),
    //         textDirection: TextDirection.ltr,
    //       ),
    //       Container(
    //         height: animation.value,
    //         width: animation.value,
    //         child: FlutterLogo(),
    //       )
    //     ],
    //   ),
    // );
  }
}
