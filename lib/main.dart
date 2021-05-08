import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data_logic.dart';
import 'package:store/dbus/sys_custom_setting.dart';
import 'package:store/widgets/home/homePage.dart';

void main() async{
  final sysConfigSetting=new SysCustomSetting();
  final sysConfig=await sysConfigSetting.getSysCustomSetting();
  runApp(MyApp(sysConfig.sysTheme));
}

class MyApp extends StatefulWidget {

  ThemeData sysTheme= ThemeData.light();
  MyApp(this.sysTheme);
  void initGlobalState(){
    final DataLogic globalLogic=Get.put(DataLogic());
    globalLogic.state.initPackageData();

  }

  @override
  State<StatefulWidget> createState() =>MyApppState(sysTheme);
  }

class MyApppState extends State<MyApp>{
  ThemeData theme;
  MyApppState(this.theme);
  @override
  void initState() {
    final DataLogic globalLogic=Get.put(DataLogic());
    globalLogic.state.initPackageData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'store',
        theme: theme,
        home: Scaffold(
          body: HomePage(),
        ),

    );
  }

}