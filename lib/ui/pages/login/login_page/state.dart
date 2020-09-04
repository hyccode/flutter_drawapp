import 'dart:ui';

import 'package:yubeiapp/global_store/state.dart';

class LoginState implements GlobalBaseState<LoginState> {
  static const LoginResult_EmailFail = 1;
  static const LoginResult_PassWordFail = 2; // 例子密码不合法，暂不实现
  static const LoginResult_NetWorkFail = 3; //例子网络错误，暂不实现
  static const LoginResult_LoginSuccess = 4;
  int loginResult = 0; //登陆的结果
  String userName;
  String pwd;

  //需要重写clone方法，因为reducer生成新的state时会调用
  @override
  LoginState clone() {
    return LoginState()
      ..loginResult = this.loginResult
      ..userName = this.userName
      ..pwd = this.pwd;
  }

  //对比方法，比较俩个实例是否相等，测试验证需要
  @override
  bool operator ==(dynamic other) {
    // TODO: implement ==
    if (!(other is LoginState)) return false;
    return loginResult == other.loginResult &&
        userName == other.userName &&
        pwd == other.pwd;
  }

  @override
  Color themeColor;
}

//这里有个静态函数，用于初始化state，具体调用位置之后会介绍
//需要注意的是 这是静态函数，不属于LoginState类
LoginState initState(Map<String, dynamic> args) {
  return LoginState()
    ..loginResult = 0
    ..userName = ""
    ..pwd = "";
}
