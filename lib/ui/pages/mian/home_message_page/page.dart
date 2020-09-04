import 'package:fish_redux/fish_redux.dart';

import 'adapter_message/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeMessagePage extends Page<HomeMessageState, Map<String, dynamic>>
    with KeepAliveMixin<HomeMessageState> {
  HomeMessagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeMessageState>(
              adapter: NoneConn<HomeMessageState>() + MessageAdapter(),
              slots: <String, Dependent<HomeMessageState>>{}),
          middleware: <Middleware<HomeMessageState>>[],
        );
}
