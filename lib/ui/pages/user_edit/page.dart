import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserEditPage extends Page<UserEditState, Map<String, dynamic>> {
  UserEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserEditState>(
                adapter: null,
                slots: <String, Dependent<UserEditState>>{
                }),
            middleware: <Middleware<UserEditState>>[
            ],);

}
