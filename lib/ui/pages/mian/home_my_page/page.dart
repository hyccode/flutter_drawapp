import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeMyPage extends Page<HomeMyState, Map<String, dynamic>>
    with KeepAliveMixin<HomeMyState> {
  HomeMyPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeMyState>(),
        );
}
