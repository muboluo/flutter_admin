import 'package:cry/cry_all.dart';
import 'package:cry/utils/adaptive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/pages/layout/layout_menu_controller.dart';
import 'package:flutter_admin/utils/utils.dart';
import 'package:get/get.dart';

class LayoutMenu2 extends StatefulWidget {
  // 用来回传数据
  final Function? onClick;

  @override
  State<StatefulWidget> createState() => _LayoutMenuState();

  LayoutMenu2({
    Key? key,
    this.onClick,
  }) : super(key: key);
}

class _LayoutMenuState extends State<LayoutMenu2> {
  final double headerHeight = 48;
  bool? expandMenu;
  bool expandAll = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutMenuController>(builder: (_) => _build(context));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _build(BuildContext context) {
    // 判断左侧 menu 布局 是否处于开启状态
    this.expandMenu ??=
        isDisplayDesktop(context) || Utils.isMenuDisplayTypeDrawer(context);

    // 1 展开 左侧 menu 布局 按钮
    var menuHeaderCollapse = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CryButton(
          iconData: Icons.chevron_right,
          tip: "展开左侧布局",
          onPressed: () {
            expandMenu = !expandMenu!;
            setState(() {});
          },
        ),
      ],
    );

    // 2 收起 左侧 menu 布局 按钮
    var menuHeaderExpand = Row(
      children: [
        CryButton(
          iconData: Icons.chevron_left,
          tip: "点击收起左侧布局",
          onPressed: () {
            expandMenu = !expandMenu!;
            setState(() {});
          },
        ),
        Expanded(
            child: Row(
          children: [
            CryButton(
              iconData: Icons.expand,
              onPressed: () {
                setState(() {
                  expandAll = true;
                });
              },
            ),
            CryButton(
              iconData: Icons.vertical_align_center,
              onPressed: () {
                setState(() {
                  expandAll = false;
                });
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ))
      ],
    );

    // 左侧 menu 控制 header 布局
    var headerLayout = Material(
      type: MaterialType.transparency, // 这个属性是什么意思？
      child: Container(
        color: Colors.white,
        height: headerHeight,
        child: expandMenu! ? menuHeaderExpand : menuHeaderCollapse,
      ),
    );

    return headerLayout;
  }
}
