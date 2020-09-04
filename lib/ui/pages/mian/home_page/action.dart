import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action, jumpToPage, changePage }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action jumpToPage(index) {
    return Action(HomeAction.jumpToPage, payload: index);
  }

  static Action changePage(index) {
    return Action(HomeAction.changePage, payload: index);
  }
}
