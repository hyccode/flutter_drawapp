import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsListAction { action }

class GoodsListActionCreator {
  static Action onAction() {
    return const Action(GoodsListAction.action);
  }
}
