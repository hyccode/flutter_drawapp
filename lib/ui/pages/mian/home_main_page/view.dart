import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yubeiapp/ui/pages/search/search_page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeMainState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text("育贝母婴教育"),
    ),
    body: SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: () {
        dispatch(HomeMainActionCreator.initData());
      },
      onLoading: () {
        dispatch(HomeMainActionCreator.loadMore());
      },
      controller: state.refreshController,
      scrollController: state.controller,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showSearch(
                      context: viewService.context,
                      delegate: SearchBarDelegate());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      height: 40,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search),
                          Text("搜索课程名称"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              viewService.buildComponent('banner'),
              viewService.buildComponent('study_task'),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: buildAdapter.itemBuilder,
                itemCount: buildAdapter.itemCount,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
