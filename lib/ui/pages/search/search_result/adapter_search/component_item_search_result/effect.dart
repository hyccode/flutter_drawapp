import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

import 'action.dart';


Effect<ItemHomeModel> buildEffect() {
  return combineEffects(<Object, Effect<ItemHomeModel>>{
    ItemSquareAction.action: _onAction,
    ItemSquareAction.click: _click,
  });
}

void _onAction(Action action, Context<ItemHomeModel> ctx) {}

void _click(Action action, Context<ItemHomeModel> ctx) {
//  LogUtil.v(ctx.state.photoOrVidio, tag: "click");
//  if (ctx.state.linkType == 2) {
//    Application.router.navigateTo(ctx.context,
//        '${Routes.video_page}?video_url=${Uri.encodeComponent(ctx.state.photoOrVidio)}');
//    return;
//  }

  Application.router.navigateTo(ctx.context, Routes.empty_page);
}
