

//TODO replace with your own action
import 'package:fish_redux/src/redux/basic.dart';

enum HomeMainAction { action,initData, loadMore, showBannerData, showSquare }

class HomeMainActionCreator {
  static Action initData() {
    return Action(HomeMainAction.initData);
  }

  static Action loadMore() {
    return Action(HomeMainAction.loadMore);
  }

}
