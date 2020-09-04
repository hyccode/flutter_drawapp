import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginPhoneState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginPhoneState>>{
      LoginPhoneAction.action: _onAction,
      LoginPhoneAction.loginSuccess: _onLoginSuccess,
    },
  );
}

LoginPhoneState _onAction(LoginPhoneState state, Action action) {
  final LoginPhoneState newState = state.clone();
  return newState;
}

LoginPhoneState _onLoginSuccess(LoginPhoneState state, Action action) {
  //返回的state一定不能拿到旧的state直接修改并返回，
  //需要创建一个新的state，大部分情况是用clone创建。
  final LoginPhoneState newState = state.clone();
  //状态赋值
  newState.loginResult = LoginPhoneState.LoginResult_LoginSuccess;
  //action.payload是action的参数，类型也是dynamic，这里不强转也不会报错，只是写的时候IDE不会
  //自动联想。所以我建议还是写上比较清晰
//  newState.userName=(action.payload as LoginEntity).userId;
//  newState.age=(action.payload as LoginEntity).session.user.age;
  return newState;
}
