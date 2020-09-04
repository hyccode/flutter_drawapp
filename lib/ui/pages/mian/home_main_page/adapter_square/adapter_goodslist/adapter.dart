import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/goodslist/state.dart';

import '../../state.dart';
import 'Item_goodsList.dart';

class GoodsListAdapter extends DynamicFlowAdapter<ItemHomeModel> {
  GoodsListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item_goodslist": ItemGoodsListComponent(),
          },
          connector: _GoodsListConnector(),
        );
}

class _GoodsListConnector extends ConnOp<ItemHomeModel, List<ItemBean>> {
  @override
  List<ItemBean> get(ItemHomeModel state) {
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
  void set(ItemHomeModel state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.messageList = List<GoodsListModel>.from(
          items.map<GoodsListModel>((ItemBean bean) => bean.data).toList());
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
