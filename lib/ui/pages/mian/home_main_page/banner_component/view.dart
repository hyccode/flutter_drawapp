import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  if (state.advertDetailsList?.isNotEmpty == true) {
    return Container(
      child: new SizedBox(
        height: 150.0,
        width: double.infinity,
        child: new Swiper(
          onTap: (int index) {
            dispatch(BannerActionCreator.onClickIndex(index));
          },
          customLayoutOption: state.customLayoutOption,
          index: state.currentIndex,
          onIndexChanged: (int index) {
            dispatch(BannerActionCreator.onChangeIndex(index));
          },
          curve: state.curve,
          controller: state.controller,
          layout: state.layout,
          outer: state.outer,
          itemHeight: 150.0,
          viewportFraction: 1,
          autoplayDelay: state.autoplayDely,
          loop: state.loop,
          autoplay: state.autoplay,
          itemBuilder: state.buildItem,
          itemCount: state.advertDetailsList.length,
          scrollDirection: state.scrollDirection,
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplayDisableOnInteraction: true,
          pagination: new SwiperPagination(
              builder: const DotSwiperPaginationBuilder(
                  size: 20.0, activeSize: 20.0, space: 10.0)),
        ),
      ),
    );
  } else {
    return Container(
      height: 0,
    );
  }
}
