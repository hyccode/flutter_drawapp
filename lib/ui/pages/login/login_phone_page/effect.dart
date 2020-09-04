import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:yubeiapp/common/common.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/data/repository/repository.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/ui/widgets/loading_dialog.dart';
import 'package:yubeiapp/utils/userInfo_util.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginPhoneState> buildEffect() {
  return combineEffects(<Object, Effect<LoginPhoneState>>{
    LoginPhoneAction.action: _onAction,
    LoginPhoneAction.login: _onLogin,
    LoginPhoneAction.getUserInfo: _getUserInfo,
  });
}

void _onAction(Action action, Context<LoginPhoneState> ctx) {}

void _onLogin(Action action, Context<LoginPhoneState> ctx) {
  Repository.getToken().listen(
    (request) {
      if (request.code == Constant.status_success) {
        Application.router
            .navigateTo(ctx.context, Routes.home, clearStack: true);
      } else {}
    },
    onError: (e) {},
    onDone: () {},
  );

//  //取出action的登陆参数，参数类型为dynamic，可以是任意对象
//  Map loginMap = action.payload;
//  String name = loginMap['name'];
//  String password = loginMap['password'];
//
//  showLoadingProgress(null, ctx.context);
//
//  Repository.login(name, password).listen((request) {
//    if (request.code == Constant.status_success) {
//      UserInfoUtil.setLoginEntify(request.item);
//      //发送登陆成功action给reducer，并model做为参数，放在action中一起传递给reducer
//      ctx.dispatch(LoginPhoneActionCreator.getUserInfo(request.item));
//    } else {
////      view.showError(msg: request.item);
//    }
//  }, onError: (e) {
//    //请求失败
////    view.showError(msg: e.toString());
//  }, onDone: () {
//    //请求结束
////    view.closeLoading();
//    Navigator.pop(ctx.context);
//  });
}

void _getUserInfo(Action action, Context<LoginPhoneState> ctx) {
//  //取出action的登陆参数，参数类型为dynamic，可以是任意对象
//  LoginEntity loginModel = action.payload;
//
//  Repository.getUserInfo(loginModel.userId).listen((request) {
//    if (request.code == Constant.status_success) {
//      UserInfoUtil.setUserInfo(request.item);
//
//      Application.router.navigateTo(ctx.context, Routes.home, clearStack: true);
//
//      //发送登陆成功action给reducer，并model做为参数，放在action中一起传递给reducer
//      ctx.dispatch(LoginPhoneActionCreator.onLoginSuccess());
//    } else {
////      view.showError(msg: request.item);
//    }
//  }, onError: (e) {
//    //请求失败
////    view.showError(msg: e.toString());
//  }, onDone: () {
//    //请求结束
////    view.closeLoading();
//  });
}

void showLoadingProgress(msg, BuildContext context) {
  showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new LoadingDialog(
          //调用对话框
          text: msg == null ? '加载中...' : msg,
        );
      });
}
