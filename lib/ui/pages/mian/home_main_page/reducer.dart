import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeMainState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeMainState>>{
      HomeMainAction.action: _onAction,
      HomeMainAction.showBannerData: _showBannerData,
      HomeMainAction.showSquare: _showSquare,
    },
  );
}

HomeMainState _onAction(HomeMainState state, Action action) {
  final HomeMainState newState = state.clone();
  return newState;
}

HomeMainState _showBannerData(HomeMainState state, Action action) {
  final HomeMainState newState = state.clone();
  List<BannerModel> xList = action.payload;
  newState.advertDetailsList = xList;
  return newState;
}

HomeMainState _showSquare(HomeMainState state, Action action) {
  final HomeMainState newState = state.clone();
  List<ItemHomeModel> xList = action.payload;
  newState.squareByStatusList = xList;
  return newState;
}
