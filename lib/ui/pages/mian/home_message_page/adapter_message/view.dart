import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../state.dart';

Widget buildView(
    MessageModel state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                margin: EdgeInsets.fromLTRB(0,0,10,0,),
                height: 50,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 40,
                ),
                color: Colors.green,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("育贝君"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                          "消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情消息详情"),
                    ),
                    Text("2017-12-12"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0,),
      ],
    ),
  );
}
