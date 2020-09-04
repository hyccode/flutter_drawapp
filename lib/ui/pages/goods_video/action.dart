import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsVideoAction { action, play, pause , playOrPause }

class GoodsVideoActionCreator {
  static Action onAction() {
    return const Action(GoodsVideoAction.action);
  }

  static Action onPlay() {
    return const Action(GoodsVideoAction.play);
  }

  static Action onPause() {
    return const Action(GoodsVideoAction.pause);
  }

  static Action onPlayOrPause() {
    return const Action(GoodsVideoAction.playOrPause);
  }
}
