import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'component_item_square/component.dart';

class SquareAdapter extends DynamicFlowAdapter<HomeMainState> {
  SquareAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item_album": ItemSquareComponent(),
          },
          connector: _SquareConnector(),
        );
}

class _SquareConnector extends ConnOp<HomeMainState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeMainState state) {
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
  void set(HomeMainState state, List<ItemBean> items) {
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
