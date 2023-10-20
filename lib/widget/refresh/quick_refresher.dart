import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QuickRefresher extends StatelessWidget {
  final Widget? child;

  final Widget? header;

  final Widget? footer;

  final Widget? emptyWidget;

  final bool enablePullUp;

  final bool enablePullDown;

  final VoidCallback? onRefresh;

  final VoidCallback? onLoading;

  final RefreshController controller;

  final Axis? scrollDirection;

  final ScrollController? scrollController;

  final bool? primary;

  final ScrollPhysics? physics;

  final double? cacheExtent;

  final bool empty;

  ///是否隐藏foot
  final bool hideFooter;

  ///footer显示文字
  final String? footerText;

  final DragStartBehavior? dragStartBehavior;

  const QuickRefresher({
    Key? key,
    required this.controller,
    this.child,
    this.header,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
    this.dragStartBehavior,
    this.primary,
    this.cacheExtent,
    this.physics,
    this.scrollDirection,
    this.scrollController,
    this.hideFooter = false,
    this.empty = false,
    this.footerText,
    this.emptyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      header: const WaterDropHeader(
        waterDropColor: Colors.blue,
      ),
      // header: CustomGifHeader(),
      footer: _refreshCustomFooter(hideFooter, footerText),
      controller: controller,
      scrollController: scrollController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: empty ? emptyWidget : child,
    );
  }

  _refreshCustomFooter(bool hideNoMore, String? noMoreStr) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        _textWidget(str) {
          return Text(
            str,
            style: TextStyle(fontSize: 24.sp, color: const Color(0x7F000028)),
          );
        }

        if (mode == LoadStatus.idle) {
          body = _textWidget("上拉加载");
        } else if (mode == LoadStatus.loading) {
          body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = _textWidget("加载失败！点击重试！");
        } else if (mode == LoadStatus.canLoading) {
          body = _textWidget("松手,加载更多!");
        } else if (mode == LoadStatus.noMore) {
          body = _textWidget(hideNoMore ? "" : noMoreStr ?? "加载完毕");
        } else {
          body = _textWidget("");
        }
        return SizedBox(
          height: 55.0,
          child: Center(
            child: body,
          ),
        );
      },
    );
  }
}
