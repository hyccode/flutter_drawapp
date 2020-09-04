import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeStoreAction { action }

class HomeStoreActionCreator {
  static Action onAction() {
    return const Action(HomeStoreAction.action);
  }
}
