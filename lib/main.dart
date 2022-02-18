/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description: 入口

import 'package:cry/common/application_context.dart';
import 'package:cry/constants/cry_constant.dart';
import 'package:cry/generated/l10n.dart' as cryS;
import 'package:cry/routes/cry_route_Information_parser.dart';
import 'package:flutter/material.dart';
import 'package:cry/cry.dart';
import 'package:flutter_admin/common/cry_dio_interceptors.dart';
import 'package:flutter_admin/pages/layout/layout.dart';
import 'package:flutter_admin/pages/layout/layout_controller.dart';
import 'package:flutter_admin/pages/layout2/layout2.dart';
import 'package:flutter_admin/pages/login.dart';
import 'package:flutter_admin/pages/register.dart';
import 'package:flutter_admin/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'generated/l10n.dart';
import 'pages/layout/layout_menu_controller.dart';
import 'router/main_router_delegate.dart';

void main() async{
  // 启动前，初始化一些配置
  await init();
  runApp(MyApp());
}

init() async {
  // 初始化缓存管理库
  await GetStorage.init();
  // 初始化 baseUrl, 超时时间，配置在 config目录下
  await ApplicationContext.instance.init();
  // 初始化网络请求拦截器
  ApplicationContext.instance.addBean(CryConstant.KEY_DIO_INTERCEPTORS, [CryDioInterceptors()]);
  // 状态管理： eg: 内容部分是否全屏
  Get.put(LayoutController());
  Get.put(LayoutMenuController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 把页面路由，注册到 pageMap中。跳转时，从 pageMap中取出目标路由。
    Map<String, Widget> pageMap = {
      '/': Layout(), // 主页路由
      '/login': Login(),
      '/register': Register(),
      '/layout2': Layout2(),
    };
    return GetMaterialApp.router(
      key: UniqueKey(),
      builder: Cry.init,
      debugShowCheckedModeBanner: false,
      title: 'FLUTTER_ADMIN',
      enableLog: false,
      theme: Utils.getThemeData(),
      darkTheme: Utils.getThemeData(isDark: true),
      localizationsDelegates: [
        S.delegate,
        cryS.S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerDelegate: MainRouterDelegate(pageMap: pageMap),
      routeInformationParser: CryRouteInformationParser(),
    );
  }
}
