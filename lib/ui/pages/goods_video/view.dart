import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GoodsVideoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("视频播放页"),
    ),
    body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.black,
              height: 250,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: state.controller.value.initialized
                        ? AspectRatio(
                            aspectRatio: state.controller.value.aspectRatio,
                            child: VideoPlayer(state.controller),
                          )
                        : Container(),
                  ),
                  Center(
                    child: state.controller.value.initialized
                        ? IconButton(
                            iconSize: 40,
                            color: Colors.white,
                            icon: Icon(state.controller.value.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled),
                            onPressed: () {
                              dispatch(GoodsVideoActionCreator.onPlayOrPause());
                            },
                          )
                        : CircularProgressIndicator(),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: 1000,
            ),
          ],
        ),
      ),
    ),
  );
}
