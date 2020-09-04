import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchResultState> buildEffect() {
  return combineEffects(<Object, Effect<SearchResultState>>{
    SearchResultAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchResultState> ctx) {
}
