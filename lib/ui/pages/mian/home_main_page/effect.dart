import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeMainState> buildEffect() {
  return combineEffects(<Object, Effect<HomeMainState>>{
    Lifecycle.initState: _init,
    HomeMainAction.action: _onAction,
    HomeMainAction.initData: _initData,
    HomeMainAction.loadMore: _loadMore,
  });
}

void _init(Action action, Context<HomeMainState> ctx) {}

void _onAction(Action action, Context<HomeMainState> ctx) {}

void _initData(Action action, Context<HomeMainState> ctx) {
  ctx.state.refreshController.refreshCompleted();
}

void _loadMore(Action action, Context<HomeMainState> ctx) {
  ctx.state.refreshController.loadNoData();
}
