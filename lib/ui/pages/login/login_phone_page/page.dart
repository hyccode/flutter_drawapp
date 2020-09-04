import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoginPhonePage extends Page<LoginPhoneState, Map<String, dynamic>> {
  LoginPhonePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LoginPhoneState>(
                adapter: null,
                slots: <String, Dependent<LoginPhoneState>>{
                }),
            middleware: <Middleware<LoginPhoneState>>[
            ],);

}
