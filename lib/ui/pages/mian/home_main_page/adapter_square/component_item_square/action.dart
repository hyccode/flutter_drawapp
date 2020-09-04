import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemSquareAction { action,click }

class ItemSquareActionCreator {
  static Action onAction() {
    return const Action(ItemSquareAction.action);
  }

  static Action click() {
    return Action(ItemSquareAction.click);
  }
}
