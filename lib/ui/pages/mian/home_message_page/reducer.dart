import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeMessageState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeMessageState>>{
      HomeStoreAction.action: _onAction,
    },
  );
}

HomeMessageState _onAction(HomeMessageState state, Action action) {
  final HomeMessageState newState = state.clone();
  return newState;
}
