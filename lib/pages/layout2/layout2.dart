import 'package:flutter/material.dart';
import 'package:flutter_admin/models/menu.dart';
import 'package:flutter_admin/pages/layout/layout_controller.dart';
import 'package:flutter_admin/pages/layout/layout_menu.dart';
import 'package:flutter_admin/utils/utils.dart';
import 'package:get/get.dart';

class Layout2 extends StatefulWidget {
  @override
  _LayoutState2 createState() => _LayoutState2();
}

class _LayoutState2 extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      GetBuilder<LayoutController>(builder: (_) => _build(context));

  Widget _build(BuildContext context) {
    LayoutMenu(onClick: (Menu menu) => Utils.openTab(menu.id!));


    return Scaffold();
  }
}
