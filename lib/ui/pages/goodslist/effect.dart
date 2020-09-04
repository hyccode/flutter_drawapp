import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/common/common.dart';
import 'package:yubeiapp/data/repository/repository.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsListState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsListState>>{
    Lifecycle.initState: _init,
    GoodsListAction.action: _onAction,
    GoodsListAction.refresh: _onRefresh,
    GoodsListAction.loadMore: _onLoadMore,
  });
}

void _init(Action action, Context<GoodsListState> ctx) {
  ctx.dispatch(GoodsListActionCreator.refresh());
}

void _onAction(Action action, Context<GoodsListState> ctx) {}

void _onRefresh(Action action, Context<GoodsListState> ctx) {
  Repository.goodsRelation().listen(
    (request) {
      if (request.code == Constant.status_success) {
      } else {}
    },
    onError: (e) {},
    onDone: () {
      ctx.state.refreshController.refreshCompleted();
    },
  );
}

void _onLoadMore(Action action, Context<GoodsListState> ctx) {
  ctx.state.refreshController.loadComplete();
}
