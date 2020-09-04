import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SettingState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text("设置"),
    ),
    body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text("修改主题"),
                onPressed: () {
                  dispatch(SettingActionCreator.onChangeTheme());
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
