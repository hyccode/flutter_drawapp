import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/mian/home_message_page/state.dart';

import '../state.dart';
import 'Item_goodsList.dart';
import 'reducer.dart';

class GoodsListAdapter extends DynamicFlowAdapter<GoodsListState> {
  GoodsListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item_goodslist": ItemGoodsListComponent(),
          },
          connector: _GoodsListConnector(),
          reducer: buildReducer(),
        );
}

class _GoodsListConnector extends ConnOp<GoodsListState, List<ItemBean>> {
  @override
  List<ItemBean> get(GoodsListState state) {
    if (state.messageList?.isNotEmpty == true) {
      List<ItemBean> items = [];
      for (var iconNameModel in state.messageList) {
        items.add(ItemBean('item_goodslist', iconNameModel));
      }
      return items;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(GoodsListState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.messageList = List<GoodsListModel>.from(
          items.map<MessageModel>((ItemBean bean) => bean.data).toList());
    } else {
      state.messageList = <GoodsListModel>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
