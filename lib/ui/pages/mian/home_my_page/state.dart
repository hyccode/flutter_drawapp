import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/data/protocol/icon_name_model.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/global_store/state.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';

class HomeMyState implements GlobalBaseState<HomeMyState> {
  UserInfoEntity userInfoItem;
  String headUrl;
  List<IconNameModel> listTitle;

  @override
  HomeMyState clone() {
    return HomeMyState()
      ..headUrl = headUrl
      ..userInfoItem = userInfoItem
      ..themeColor = themeColor
      ..listTitle = listTitle;
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        child: Column(
          children: <Widget>[
            new Divider(
              height: 10,
              thickness: 10,
            ),
            ListTile(
              leading: Icon(listTitle[index].icon),
              title: Text(listTitle[index].name),
              onTap: () {
                Application.router.navigateTo(context, Routes.edit_userinfo);
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            new Divider(
              height: 10,
              thickness: 10,
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(listTitle[index].icon),
              title: Text(listTitle[index].name),
              onTap: () {
                Application.router.navigateTo(context, Routes.empty_page);
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            new Divider(height: 1,)
          ],
        ),
      );
    }
  }

  @override
  Color themeColor;
}

HomeMyState initState(Map<String, dynamic> args) {
  final List<IconNameModel> initToDos = <IconNameModel>[
    IconNameModel(
      name: '个人信息',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '我的活动',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '我的打卡',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '我的已购',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '赠送记录',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '优惠卷',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '兑换码',
      icon: Icons.person,
    ),
  ];
  return HomeMyState()..listTitle = initToDos;
}
