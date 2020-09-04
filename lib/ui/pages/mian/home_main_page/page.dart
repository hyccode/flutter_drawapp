import 'package:fish_redux/fish_redux.dart';


import 'adapter_square/adapter.dart';
import 'banner_component/component.dart';
import 'component_study_task/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeMainPage extends Page<HomeMainState, Map<String, dynamic>>
    with KeepAliveMixin<HomeMainState> {
  HomeMainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeMainState>(
              adapter:NoneConn<HomeMainState>() + SquareAdapter(),
              slots: <String, Dependent<HomeMainState>>{
                'banner': BannerConnector() + BannerComponent(),
                'study_task': StudyTaskConnector() + StudyTaskComponent(),
              }),
          middleware: <Middleware<HomeMainState>>[],
        );
}
