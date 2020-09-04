import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginPhoneAction { action, login,loginSuccess,getUserInfo  }

class LoginPhoneActionCreator {
  static Action onAction() {
    return const Action(LoginPhoneAction.action);
  }


  static Action onLoginSuccess() {
    return Action(LoginPhoneAction.loginSuccess);
  }

  static Action onLoginAction(params) {
    return Action(LoginPhoneAction.login, payload: params);
  }

  static Action getUserInfo(params) {
    return Action(LoginPhoneAction.getUserInfo, payload: params);
  }
}
