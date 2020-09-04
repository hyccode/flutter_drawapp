import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SquareAction { action }

class SquareActionCreator {
  static Action onAction() {
    return const Action(SquareAction.action);
  }
}
