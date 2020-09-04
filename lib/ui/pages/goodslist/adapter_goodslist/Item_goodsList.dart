import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/goodslist/adapter_goodslist/view.dart';

import '../state.dart';
import 'effect.dart';

class ItemGoodsListComponent extends Component<GoodsListModel> {
  ItemGoodsListComponent()
      : super(
          view: buildView,
        );
}
