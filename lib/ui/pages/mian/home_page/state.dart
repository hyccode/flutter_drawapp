import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yubeiapp/global_store/state.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/page.dart';
import 'package:yubeiapp/ui/pages/mian/home_message_page/page.dart';
import 'package:yubeiapp/ui/pages/mian/home_my_page/page.dart';
import 'package:yubeiapp/utils/fluro_fish_redux_util.dart';

class HomeState implements GlobalBaseState<HomeState> {
  int currentIndex = 0;
  PageController controller;

  /*
   * 存储的四个页面，和Fragment一样
   */
  var bodys = [
    FluroFishReduxUtils.createPage(HomeMainPage(), null),
    FluroFishReduxUtils.createPage(HomeMessagePage(), null),
    FluroFishReduxUtils.createPage(HomeMyPage(), null),
  ];

  List<BottomNavigationBarItem> listView = [
    getBottomNavigationBarItem(0),
    getBottomNavigationBarItem(1),
    getBottomNavigationBarItem(2),
  ];

  @override
  HomeState clone() {
    return HomeState()
      ..controller = this.controller
      ..currentIndex = this.currentIndex;
  }

  @override
  Color themeColor;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..controller = new PageController(
      initialPage: 0,
    )
    ..currentIndex = 0;
}

var list = [
  "首页",
  "消息",
  "我的",
];

var list_icon = [
  Icons.home,
  Icons.message,
  Icons.person,
];

getBottomNavigationBarItem(int index) {
  return BottomNavigationBarItem(
    icon: Icon(list_icon[index]),
    title: Text(list[index]),
  );
}
