import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/utils/userInfo_util.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'data/protocol/response/user_info_entity.dart';

Widget createApp() {
  //初始化路由
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
  return new MaterialApp(
    title: "(flutter)大塘小鱼",
    theme: ThemeData(backgroundColor: Colors.white),
    home: new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: StartPage(),
    ),
    onGenerateRoute: Application.router.generator,
  );
}

class StartPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //初始化微信
    _initFluwx();
    //判断是否登陆
    toLogin(context);
    return Center(
      child: Text("启动页"),
    );
  }

  toLogin(BuildContext context) {
    UserInfoUtil.getUserInfo().then((UserInfoEntity userInfoItem) {
//      if (userInfoItem == null) {
//        Application.router.navigateTo(context, Routes.login, clearStack: true);
//      } else {
      Application.router.navigateTo(context, Routes.home, clearStack: true);
//      }
    });
  }
}

_initFluwx() async {
  await fluwx.registerWxApi(
      appId: "wxdf5fc6f43b6d1bfe",
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: "https://your.univerallink.com/link/");
  var result = await fluwx.isWeChatInstalled();
  print("is installed $result");
}
