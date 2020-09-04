import 'package:fish_redux/fish_redux.dart';

class GoodsDetailsState implements Cloneable<GoodsDetailsState> {

  @override
  GoodsDetailsState clone() {
    return GoodsDetailsState();
  }
}

GoodsDetailsState initState(Map<String, dynamic> args) {
  return GoodsDetailsState();
}
