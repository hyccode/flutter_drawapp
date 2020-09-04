import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsDetailsState>>{
      GoodsDetailsAction.action: _onAction,
    },
  );
}

GoodsDetailsState _onAction(GoodsDetailsState state, Action action) {
  final GoodsDetailsState newState = state.clone();
  return newState;
}
