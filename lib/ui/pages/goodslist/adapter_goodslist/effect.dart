import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import 'action.dart';

Effect<GoodsListModel> buildEffect() {
  return combineEffects(<Object, Effect<GoodsListModel>>{
    GoodsListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsListModel> ctx) {
}
