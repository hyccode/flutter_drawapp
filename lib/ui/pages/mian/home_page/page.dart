import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/mian/home_page/reducer.dart';
import 'package:yubeiapp/ui/pages/mian/home_page/view.dart';

import 'effect.dart';
import 'state.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: null, slots: <String, Dependent<HomeState>>{}),
          middleware: <Middleware<HomeState>>[],
        );
}
