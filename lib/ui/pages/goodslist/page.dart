import 'package:fish_redux/fish_redux.dart';

import 'adapter_goodslist/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsListPage extends Page<GoodsListState, Map<String, dynamic>> {
  GoodsListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsListState>(
                adapter: NoneConn<GoodsListState>() + GoodsListAdapter(),
                slots: <String, Dependent<GoodsListState>>{
                }),
            middleware: <Middleware<GoodsListState>>[
            ],);

}
