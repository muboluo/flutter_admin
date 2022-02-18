import 'package:flutter/material.dart';
import 'package:flutter_admin/pages/layout/layout_controller.dart';
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
    return Scaffold();
  }
}
