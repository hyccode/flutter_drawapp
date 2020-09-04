import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action, register, getUserInfo, sendWeChatAuth }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onRegister(params) {
    return Action(LoginAction.register, payload: params);
  }

  static Action getUserInfo(params) {
    return Action(LoginAction.getUserInfo, payload: params);
  }

  static Action sendWeChatAuth() {
    return Action(LoginAction.sendWeChatAuth);
  }
}
