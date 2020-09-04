import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/ui/pages/mian/home_my_page/action.dart';

import 'state.dart';

Widget buildView(
    HomeMyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text("我的"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.settings), onPressed: (){
          Application.router
              .navigateTo(viewService.context, Routes.setting);
        })
      ],
    ),
    body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Application.router
                    .navigateTo(viewService.context, Routes.edit_userinfo)
                    .then((value) {
                  dispatch(HomeMyActionCreator.refreshUserInfo());
                });
              },
              child: ClipOval(
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: (state.headUrl == null)
                        ? null
                        : Image.asset(state.headUrl)
//                      : CachedNetworkImage(
//                          imageUrl: state.headUrl,
//                          errorWidget: (context, url, error) =>
//                              Icon(Icons.error),
//                          placeholder: (context, url) =>
//                              CircularProgressIndicator(),
//                        ),
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("姓名"),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: state.buildItem,
              itemCount: state.listTitle.length,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Application.router
                    .navigateTo(viewService.context, Routes.login);
              },
              child: Text("登陆"),
            )
          ],
        ),
      ),
    ),
  );
}
