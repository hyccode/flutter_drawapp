import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/data/protocol/icon_name_model.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';

Widget buildView(
    IconNameModel state, Dispatch dispatch, ViewService viewService) {
  return Container(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () {
        Application.router.navigateTo(viewService.context, Routes.goodslist);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(state.icon,color: Colors.green,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(state.name),
          ),
        ],
      ),
    ),
  );
}
