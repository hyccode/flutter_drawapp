import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/common/common.dart';
import 'package:yubeiapp/data/protocol/response/register_entity.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/data/repository/repository.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/utils/userInfo_util.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    //收到type为login的action执行，onlogin方法，这里开发者不用定义参数，是因为已经被Effect定义好的，
    //参数为action和Context<T>
    Lifecycle.initState: _init,
    LoginAction.action: _onAction,
    LoginAction.register: _onRegister,
    LoginAction.getUserInfo: _getUserInfo,
    LoginAction.sendWeChatAuth: _sendWeChatAuth,
  });
}

void _init(Action action, Context<LoginState> ctx) {
  fluwx.responseFromAuth.listen((data) {
    //do something.
    LogUtil.e(data.toString(), tag: "wechat");
    ctx.dispatch(
        LoginActionCreator.getUserInfo("oQTFO0cUS3BwmyjyaYFUuYIpf3Po"));
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onRegister(Action action, Context<LoginState> ctx) {
  //取出action的登陆参数，参数类型为dynamic，可以是任意对象
  String wxUnionId = action.payload;
  Repository.register<RegisterEntity>(wxUnionId).listen(
    (request) {
      if (request.code == Constant.status_success) {
        RegisterEntity registerEntity = request.data;
        UserInfoUtil.setUserId(registerEntity.userId);
      } else {}
    },
    onError: (e) {},
    onDone: () {},
  );
}

void _getUserInfo(Action action, Context<LoginState> ctx) {
  //取出action的登陆参数，参数类型为dynamic，可以是任意对象
  String wxUnionId = action.payload;
  Repository.getUserInfo<UserInfoEntity>(wxUnionId).listen(
    (request) {
      if (request.code == Constant.status_success) {
        UserInfoEntity userInfoEntity = request.data;
        UserInfoUtil.setUserInfo(userInfoEntity);
        UserInfoUtil.setUserId(userInfoEntity.userId);
        Application.router
            .navigateTo(ctx.context, Routes.home, clearStack: true);
      } else {
        //用户不存在
        if (request.code == 2506) {
          ctx.dispatch(LoginActionCreator.onRegister(wxUnionId));
        }
      }
    },
    onError: (e) {},
    onDone: () {},
  );
}

void _sendWeChatAuth(Action action, Context<LoginState> ctx) {
  fluwx.sendWeChatAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test");
}
