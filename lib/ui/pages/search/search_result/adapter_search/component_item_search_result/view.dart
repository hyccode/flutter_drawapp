import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

import '../../state.dart';

Widget buildView(
    ItemHomeModel state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Container(
    child: Column(
      children: <Widget>[
        Divider(
          thickness: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Application.router
                .navigateTo(viewService.context, Routes.goodslist);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text("专栏"),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: buildAdapter.itemBuilder,
          itemCount: buildAdapter.itemCount,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("点击查看更多"),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    ),
  );
}
