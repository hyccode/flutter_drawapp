import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsDetailsAction { action }

class GoodsDetailsActionCreator {
  static Action onAction() {
    return const Action(GoodsDetailsAction.action);
  }
}
