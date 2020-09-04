import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SettingAction {
  action,
  onChangeTheme,
}

class SettingActionCreator {
  static Action onAction() {
    return const Action(SettingAction.action);
  }

  static Action onChangeTheme() {
    return Action(SettingAction.onChangeTheme);
  }
}
