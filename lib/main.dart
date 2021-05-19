import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/bindings/home_bindings.dart';
import 'package:store/dbus/sys_custom_setting.dart';
import 'package:store/router/router.dart';
void main() async{
  final sysConfigSetting=new SysCustomSetting();
  final sysConfig=await sysConfigSetting.getSysCustomSetting();
  runApp(MyApp(sysConfig.sysTheme));
}

class MyApp extends StatelessWidget {
  ThemeData sysTheme= ThemeData.light();
  MyApp(this.sysTheme);
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'store',
      theme: sysTheme,
      defaultGlobalState:true,
      getPages: RouteConfig.getPages,
      initialRoute: '/',
      initialBinding:HomeBinding(),

    );
  }
  }
