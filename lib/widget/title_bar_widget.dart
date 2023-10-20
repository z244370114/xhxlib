import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utlis/image_util.dart';

///公共TitleBar组件
class TitleBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? flexibleSpaceWidget;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final bool? isShowBack;
  final TextStyle? textStyle;
  final Function? onBack;
  final Function? onSearch;
  final List<Widget>? actionList;

  const TitleBarWidget({
    Key? key,
    this.title,
    this.titleColor,
    this.leading,
    this.titleWidget,
    this.flexibleSpaceWidget,
    this.toolbarHeight,
    this.backgroundColor = Colors.white,
    this.textStyle,
    this.isShowBack = true,
    this.actionList,
    this.onBack,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: isShowBack!,
      elevation: 0,
      flexibleSpace: flexibleSpaceWidget,
      leading: leading ??
          IconButton(
            icon: Image.asset(
              ImgUtli.getImgPath('icon_back'),
              width: 25,
              height: 30,
            ),
            onPressed: () {
              if (onBack == null) {
                Get.back();
              } else {
                onBack!.call();
              }
            },
          ),
      title: titleWidget ??
          Text(
            title ?? '',
            style: textStyle ??
                TextStyle(
                  color: titleColor ?? Color(0xFF222222),
                  fontSize: 18,
                ),
          ),
      actions: onSearch != null
          ? [
              IconButton(
                icon: Image.asset(
                  ImgUtli.getImgPath('icon_search'),
                  width: 50,
                  height: 45,
                ),
                onPressed: () {
                  onSearch!.call();
                },
              )
            ]
          : actionList,
      toolbarHeight: toolbarHeight ?? 50,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 50);
}
