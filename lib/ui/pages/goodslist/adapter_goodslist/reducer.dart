import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<GoodsListState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsListState>>{
      GoodsListAction.action: _onAction,
    },
  );
}

GoodsListState _onAction(GoodsListState state, Action action) {
  final GoodsListState newState = state.clone();
  return newState;
}
