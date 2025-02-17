import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsDetailsPage extends Page<GoodsDetailsState, Map<String, dynamic>> {
  GoodsDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsDetailsState>(
                adapter: null,
                slots: <String, Dependent<GoodsDetailsState>>{
                }),
            middleware: <Middleware<GoodsDetailsState>>[
            ],);

}
