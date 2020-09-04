import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.jumpToPage: _onJumpToPage,
      HomeAction.changePage: _onChangePage,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _onJumpToPage(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.controller.jumpToPage(action.payload);
  newState.currentIndex = action.payload;
  return newState;
}

HomeState _onChangePage(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}


