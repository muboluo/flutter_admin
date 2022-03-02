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
    this.expandMenu ??= isDisplayDesktop(context) || Utils.isMenuDisplayTypeDrawer(context);

    return Drawer(child: Row());
  }
}
