import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.action: _onAction,
    BannerAction.clickIndex: _onClickIndex,
  });
}

void _onAction(Action action, Context<BannerState> ctx) {}

void _onClickIndex(Action action, Context<BannerState> ctx) {
//  Navigator.of(ctx.context)
//      .push(new MaterialPageRoute(builder: (BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("New page"),
//      ),
//      body: Container(),
//    );
//  }));
  Application.router.navigateTo(ctx.context, Routes.goodsDetails);

}
