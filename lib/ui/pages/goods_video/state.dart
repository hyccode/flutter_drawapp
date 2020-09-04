import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';

class GoodsVideoState implements Cloneable<GoodsVideoState> {
  VideoPlayerController controller;

  @override
  GoodsVideoState clone() {
    return GoodsVideoState()..controller=controller;
  }
}

GoodsVideoState initState(Map<String, dynamic> args) {
  return GoodsVideoState();
}
