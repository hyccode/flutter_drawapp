import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yubeiapp/ui/pages/goods_details/page.dart';
import 'package:yubeiapp/ui/pages/goods_video/page.dart';
import 'package:yubeiapp/ui/pages/goodslist/page.dart';
import 'package:yubeiapp/ui/pages/login/login_page/page.dart';
import 'package:yubeiapp/ui/pages/login/login_phone_page/page.dart';
import 'package:yubeiapp/ui/pages/mian/home_page/page.dart';
import 'package:yubeiapp/ui/pages/setting_page/page.dart';
import 'package:yubeiapp/ui/pages/user_edit/page.dart';
import 'package:yubeiapp/ui/widgets/video_page.dart';
import 'package:yubeiapp/utils/fluro_fish_redux_util.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(HomePage(), params);
  },
);

// 登录界面
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(LoginPage(), params);
  },
);

// 手机号登录界面
var loginPhoneHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(LoginPhonePage(), params);
  },
);

// 编辑用户信息界面
var editUserInfoHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(UserEditPage(), params);
  },
);
// 编辑用户信息界面
var settingHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(SettingPage(), params);
  },
);
// 专辑列表页
var goodslistHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(GoodsListPage(), params);
  },
);
// 专辑列表页
var goodsDetailsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(GoodsDetailsPage(), params);
  },
);
// 专辑列表页
var goodsVideoHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FluroFishReduxUtils.createPage(GoodsVideoPage(), params);
  },
);

// 视频播放界面
var videoHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String video_url = params['video_url']?.first;
    return VideoPage(video_url);
  },
);

// 空布局
var emptyHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New page"),
      ),
      body: Container(),
    );
  },
);
