import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/global_store/action.dart';
import 'package:yubeiapp/global_store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<SettingState> buildEffect() {
  return combineEffects(<Object, Effect<SettingState>>{
    SettingAction.action: _onAction,
    SettingAction.onChangeTheme: _onChangeTheme,
  });
}

void _onAction(Action action, Context<SettingState> ctx) {
}

void _onChangeTheme(Action action, Context<SettingState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
}
