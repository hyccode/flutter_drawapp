import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsVideoState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsVideoState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    GoodsVideoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsVideoState> ctx) {}

void _init(Action action, Context<GoodsVideoState> ctx) {
  ctx.state.controller = VideoPlayerController.network(
      "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
    ..initialize().then((_) {
      ctx.dispatch(GoodsVideoActionCreator.onPlay());
    });
  ctx.state.controller.setLooping(true);
}

void _dispose(Action action, Context<GoodsVideoState> ctx) {
  ctx.state.controller.dispose();
}
