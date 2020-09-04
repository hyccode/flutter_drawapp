import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage()
      : super(
          //这里传入初始化一个初始化函数，也就是state.dart中定义的初始化函数
          initState: initState,
          //一个返回effect函数，在effect.dart中定义
          effect: buildEffect(),
          //一个返回reducer函数，在reducer.dart中定义
          reducer: buildReducer(),
          //一个返回reducer函数
          view: buildView,
          dependencies: Dependencies<LoginState>(
              adapter: null, slots: <String, Dependent<LoginState>>{}),
          middleware: <Middleware<LoginState>>[],
        );
}
