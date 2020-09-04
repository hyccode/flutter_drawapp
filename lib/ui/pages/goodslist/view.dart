import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsListState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text("频道"),
    ),
    body: SafeArea(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        onRefresh: () {
          dispatch(GoodsListActionCreator.refresh());
        },
        onLoading: () {
          dispatch(GoodsListActionCreator.loadMore());
        },
        controller: state.refreshController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: buildAdapter.itemBuilder,
            itemCount: buildAdapter.itemCount,
          ),
        ),
      ),
    ),
  );
}
