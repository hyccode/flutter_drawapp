import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yubeiapp/routers/router_handler.dart';
import 'package:yubeiapp/ui/pages/login/login_page/page.dart';
import 'package:yubeiapp/ui/pages/mian/home_page/page.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String login_phone = "/login_phone";
  static String setting = "/setting";
  static String empty_page = "/empty_page";
  static String video_page = "/video_page";
  static String edit_userinfo = "/edit_userinfo";
  static String goodslist = "/goodslist";
  static String goodsDetails = "/goodsDetails";
  static String goodsVideo = "/goodsVideo";

  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
    router.define(login_phone, handler: loginPhoneHandler);
    router.define(home, handler: homeHandler);
    router.define(video_page, handler: videoHandler);
    router.define(edit_userinfo, handler: editUserInfoHandler);
    router.define(setting, handler: settingHandler);
    router.define(goodslist, handler: goodslistHandler);
    router.define(goodsDetails, handler: goodsDetailsHandler);
    router.define(goodsVideo, handler: goodsVideoHandler);
    router.define(
      empty_page,
      handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return Scaffold(
            appBar: AppBar(
              title: Text("New page"),
            ),
            body: Container(),
          );
        },
      ),
    );
  }
}

const routes =["/home","/login"];
List pages =[LoginPage(),HomePage()];




