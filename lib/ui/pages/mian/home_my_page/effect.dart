import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/utils/userInfo_util.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeMyState> buildEffect() {
  return combineEffects(<Object, Effect<HomeMyState>>{
    Lifecycle.initState: _init,
    HomeMyAction.action: _onAction,
    HomeMyAction.refreshUserInfo: _init,
    HomeMyAction.loginOut: _onLoginOut,
  });
}

void _init(Action action, Context<HomeMyState> ctx) {
  UserInfoUtil.getUserInfo().then((UserInfoEntity userInfoItem) {
    ctx.dispatch(HomeMyActionCreator.showUserInfo(userInfoItem));
  });
}

void _onAction(Action action, Context<HomeMyState> ctx) {}

void _onLoginOut(Action action, Context<HomeMyState> ctx) {
  clearDate(ctx.context);
}

/**
 * 清除缓存并跳转登录页
 */
void clearDate(BuildContext context) {
  UserInfoUtil.clearUserInfo();
  Application.router.navigateTo(context, Routes.login, clearStack: true);
}
