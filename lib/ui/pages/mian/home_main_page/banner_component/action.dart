import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BannerAction { action, clickIndex, changeIndex }

class BannerActionCreator {
  static Action onAction() {
    return const Action(BannerAction.action);
  }

  static Action onClickIndex(int index) {
    return Action(BannerAction.clickIndex, payload: index);
  }

  static Action onChangeIndex(int index) {
    return Action(BannerAction.changeIndex, payload: index);
  }
}
