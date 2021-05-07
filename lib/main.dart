import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data_logic.dart';

import 'home/homePage.dart';
import 'package:store/dbus/sys_custom_setting.dart';

void main() async{
  final sysConfigSetting=new SysCustomSetting();
  final sysConfig=await sysConfigSetting.getSysCustomSetting();
  runApp(MyApp(sysConfig.sysTheme));
}

class MyApp extends StatelessWidget {

  ThemeData sysTheme= ThemeData.light();
  MyApp(this.sysTheme);
  void initGlobalState(){
    final DataLogic globalLogic=Get.put(DataLogic(),permanent: true);
    globalLogic.state.initPackageData();
    print(globalLogic.state.dataList.value[0].id);
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'store',
      theme: sysTheme,
      home: Scaffold(
        body: HomePage(),
      ),
      onInit: initGlobalState
    );
  }
}
