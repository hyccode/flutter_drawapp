import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GoodsDetailsState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("详情页"),
    ),
    body: SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: RaisedButton(
                    onPressed: () {
                      Application.router
                          .navigateTo(viewService.context, Routes.goodsVideo);
                    },
                    child: Text("视频播放页"),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.orange,
                    child: Text("会员免费"),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.green,
                    child: Text("单买：¥19.90"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
