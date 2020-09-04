import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<BannerState>>{
      BannerAction.action: _onAction,
      BannerAction.changeIndex: _onChangeIndex,
    },
  );
}

BannerState _onAction(BannerState state, Action action) {
  final BannerState newState = state.clone();
  return newState;
}

BannerState _onChangeIndex(BannerState state, Action action) {
  int position = action.payload;
  final BannerState newState = state.clone();
  newState.currentIndex = position;
  return newState;
}
