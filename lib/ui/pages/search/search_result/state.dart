import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/goodslist/state.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

class SearchResultState implements Cloneable<SearchResultState> {
  String query;
  List<ItemHomeModel> squareByStatusList;

  @override
  SearchResultState clone() {
    return SearchResultState()
      ..query = query
      ..squareByStatusList = squareByStatusList;
  }
}

SearchResultState initState(String query) {
  return SearchResultState()
    ..query = query
    ..squareByStatusList = [
      ItemHomeModel(title: "第一个", messageList: [
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
      ]),
      ItemHomeModel(title: "第二个", messageList: [
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
      ]),
      ItemHomeModel(title: "第三个", messageList: [
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
        GoodsListModel(title: ""),
      ]),
    ];
}
