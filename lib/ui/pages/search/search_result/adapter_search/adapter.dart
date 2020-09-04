import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

import '../state.dart';
import 'component_item_search_result/component.dart';

class SearchResultAdapter extends DynamicFlowAdapter<SearchResultState> {
  SearchResultAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item_album": ItemSearchResultComponent(),
          },
          connector: _SquareConnector(),
        );
}

class _SquareConnector extends ConnOp<SearchResultState, List<ItemBean>> {
  @override
  List<ItemBean> get(SearchResultState state) {
    if (state.squareByStatusList?.isNotEmpty == true) {
      List<ItemBean> items = [];
      for (var iconNameModel in state.squareByStatusList) {
        items.add(ItemBean('item_album', iconNameModel));
      }
      return items;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(SearchResultState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.squareByStatusList = List<ItemHomeModel>.from(
          items.map<ItemHomeModel>((ItemBean bean) => bean.data).toList());
    } else {
      state.squareByStatusList = <ItemHomeModel>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
