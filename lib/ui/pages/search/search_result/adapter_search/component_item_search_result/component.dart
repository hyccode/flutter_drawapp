import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/adapter_square/adapter_goodslist/adapter.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

import '../../state.dart';
import 'effect.dart';
import 'view.dart';

class ItemSearchResultComponent extends Component<ItemHomeModel> {
  ItemSearchResultComponent()
      : super(
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<ItemHomeModel>(
                adapter: NoneConn<ItemHomeModel>() + GoodsListAdapter(),
                slots: <String, Dependent<ItemHomeModel>>{
                }),);

}
