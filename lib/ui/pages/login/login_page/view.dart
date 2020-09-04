import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/routers/routers.dart';
import 'package:yubeiapp/ui/pages/login/login_page/action.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return LoginViewWidget(dispatch);
}

class LoginViewWidget extends StatefulWidget {
  Dispatch dispatch;

  LoginViewWidget(this.dispatch);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250.0,
                      height: 60.0,
                      child: RaisedButton(
                        child: const Text("微信一键登录"),
                        color: Colors.green,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
//                          ToastUtils.show("暂不支持！");
                          widget.dispatch(LoginActionCreator.sendWeChatAuth());
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      width: 250.0,
                      height: 60.0,
                      child: RaisedButton(
                        child: const Text('手机号登录'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Application.router
                              .navigateTo(context, Routes.login_phone);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
