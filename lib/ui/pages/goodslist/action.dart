import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsListAction { action,refresh,loadMore, }

class GoodsListActionCreator {
  static Action onAction() {
    return const Action(GoodsListAction.action);
  }

  static Action refresh() {return const Action(GoodsListAction.refresh);}

  static Action loadMore() {return const Action(GoodsListAction.loadMore);}
}
