import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/data/protocol/icon_name_model.dart';

import 'view.dart';

class ItemStudyTaskComponent extends Component<IconNameModel> {
  ItemStudyTaskComponent()
      : super(
          view: buildView,
        );
}
