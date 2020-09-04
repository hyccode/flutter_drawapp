import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GoodsListState implements Cloneable<GoodsListState> {
  List<GoodsListModel> messageList;
  RefreshController refreshController;

  @override
  GoodsListState clone() {
    return GoodsListState()
      ..refreshController = refreshController
      ..messageList = messageList;
  }
}

GoodsListState initState(Map<String, dynamic> args) {
  final List<GoodsListModel> initToDos = <GoodsListModel>[
    GoodsListModel(
      title: '第一条消息',
    ),
    GoodsListModel(
      title: '第二条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
    GoodsListModel(
      title: '第三条消息',
    ),
  ];
  return GoodsListState()
    ..messageList = initToDos
    ..refreshController = RefreshController(initialRefresh: false);
}

class GoodsListModel {
  String title;

  GoodsListModel({
    this.title,
  });
}
