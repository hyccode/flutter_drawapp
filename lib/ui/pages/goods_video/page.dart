import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsVideoPage extends Page<GoodsVideoState, Map<String, dynamic>> {
  GoodsVideoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsVideoState>(
                adapter: null,
                slots: <String, Dependent<GoodsVideoState>>{
                }),
            middleware: <Middleware<GoodsVideoState>>[
            ],);

}
