import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/routers/application.dart';
import 'package:yubeiapp/ui/widgets/text_from_field.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LoginPhoneState state, Dispatch dispatch, ViewService viewService) {
  return LoginPhoneViewWidget(dispatch);
}

class LoginPhoneViewWidget extends StatefulWidget {
  Dispatch dispatch;

  LoginPhoneViewWidget(this.dispatch);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPhoneViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.all(24.0),
              children: <Widget>[
                const SizedBox(height: 70.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16.0),
                    Text(
                      '手机号登录',
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(
                      '为您提供更完整的教学服务',
                    ),
                  ],
                ),
                const SizedBox(height: 120.0),
                Form(
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: '请输入您的手机号',
                          labelText: '手机号 *',
                        ),
                        validator: (val) => (val == null || val.isEmpty)
                            ? "手机号不能为空"
                            : null, //表单验证
                        onSaved: (val) {
                          _name = val;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      PasswordField(
                        hintText: '请输入您的登录密码',
                        labelText: '密码 *',
//                    helperText: "密码最多设置8位",
                        validator: (val) =>
                            (val == null || val.isEmpty) ? "密码不能为空" : null,
                        //表单验证
                        onSaved: (val) {
                          _password = val;
                        },
                        onFieldSubmitted: (String value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: const Text('登录'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: _handleSubmitted,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Application.router.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  //点击登录
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showInSnackBar('请输入正确的手机号和密码！');
    } else {
      form.save();

      //获取数据
      var name = _name;
      var password = _password;

      //组装数据
      Map<String, dynamic> map = {"name": name, "password": password};
      //发送包装好数据Action
      widget.dispatch(LoginPhoneActionCreator.onLoginAction(map));
    }
  }


}
