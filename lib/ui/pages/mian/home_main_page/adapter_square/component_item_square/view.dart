import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';

import '../../state.dart';

Widget buildView(
    ItemHomeModel state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Container(
    child: Column(
      children: <Widget>[
        Divider(thickness: 10,height: 10,),
        GestureDetector(
          onTap: (){
            Application.router.navigateTo(viewService.context, Routes.goodslist);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("专栏"),
                Row(
                  children: <Widget>[
                    Text("查看全部"),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: buildAdapter.itemBuilder,
          itemCount: buildAdapter.itemCount,
        ),
      ],
    ),
  );
}
