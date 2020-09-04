import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';

import '../state.dart';

Widget buildView(
    GoodsListModel state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      Application.router.navigateTo(viewService.context, Routes.goodsDetails);
    },
    child: Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    height: 80,
                    color: Colors.green,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("标题"),
                        Expanded(
                          child: Text(
                            "详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情",
                            maxLines:1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("0人开通"),
                            Text("¥999.0/年"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
          ),
        ],
      ),
    ),
  );
}
