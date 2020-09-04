import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsDetailsState>>{
    GoodsDetailsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsDetailsState> ctx) {
}
