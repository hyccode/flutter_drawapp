import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeMessageState> buildEffect() {
  return combineEffects(<Object, Effect<HomeMessageState>>{
    HomeStoreAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeMessageState> ctx) {
}
