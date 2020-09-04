import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'item_message.dart';

class MessageAdapter extends DynamicFlowAdapter<HomeMessageState> {
  MessageAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item_message": ItemMessageComponent(),
          },
          connector: _MessageConnector(),
        );
}

class _MessageConnector extends ConnOp<HomeMessageState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeMessageState state) {
    if (state.messageList?.isNotEmpty == true) {
      List<ItemBean> items = [];
      for (var iconNameModel in state.messageList) {
        items.add(ItemBean('item_message', iconNameModel));
      }
      return items;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeMessageState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.messageList = List<MessageModel>.from(
          items.map<MessageModel>((ItemBean bean) => bean.data).toList());
    } else {
      state.messageList = <MessageModel>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
