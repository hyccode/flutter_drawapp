import 'package:fish_redux/fish_redux.dart';

import 'adapter_search/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchResultPage extends Page<SearchResultState, String> {
  SearchResultPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchResultState>(
                adapter:NoneConn<SearchResultState>() + SearchResultAdapter(),
                slots: <String, Dependent<SearchResultState>>{
                }),
            middleware: <Middleware<SearchResultState>>[
            ],);

}
