import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dbus_register.dart';
class SysCustomSetting {
  //dbus地址
  final dBus=dBusConfig;
  //获取系统配置
  Future<SysCustomSettingType> getSysCustomSetting() async {
    Map<String, dynamic> sysConfig = new Map();
    var client = DBusClient.session();
    var object = DBusRemoteObjectManager(client, dBus.sysCustomConfig.name,
        DBusObjectPath( dBus.sysCustomConfig.path));
    object.signals.listen((signal) {
      if (signal is DBusObjectManagerInterfacesAddedSignal) {
        printInterfacesAndProperties(signal.interfacesAndProperties);
      } else if (signal is DBusObjectManagerInterfacesRemovedSignal) {

      } else if (signal is DBusPropertiesChangedSignal) {
        //监听变化元素，检查里面是否有GTKtheme属性
        printInterfacesAndProperties(
            {signal.propertiesInterface: signal.changedProperties});
      }
    });
    var properties =
        await object.getAllProperties(dBus.sysCustomConfig.interface);
    properties.forEach((name, value) {
      if (name == 'GtkTheme') {
        final getTheme = value.toNative();
          sysConfig['SysTheme']=handelSysThemeString(getTheme);
      } else {
        sysConfig[name] = value.toNative();
      }
    });
    SysCustomSettingType handelConfig=SysCustomSettingType.fromJson(sysConfig);
     return handelConfig;
  }

  ThemeData handelSysThemeString(String themeStr){
    ThemeData str;
    if(themeStr=='deepin'){
      str=ThemeData.light();
    }else if(themeStr=='deepin-dark'){
      str = ThemeData.dark();
    }else{
      str = ThemeData.light();
    }
    return str;
  }
  void printInterfacesAndProperties(
      Map<String, Map<String, DBusValue>> interfacesAndProperties) {
    interfacesAndProperties.forEach((interface, properties) {
      properties.forEach((name, value) {
        if(name=='GtkTheme'){
          var theme=handelSysThemeString(value.toNative());
          Get.changeTheme(theme);
        }
      });
    });
  }
}

class SysCustomSettingType {
  double opacity;
  String cursorTheme;
  String activeColor;
  String standardFont;
  String monospaceFont;
  ThemeData sysTheme;
  double fontSize;
  SysCustomSettingType(
      {this.opacity,
      this.cursorTheme,
      this.activeColor,
      this.standardFont,
      this.monospaceFont,
      this.sysTheme,
      this.fontSize});
  factory SysCustomSettingType.fromJson(Map<String, dynamic> json) =>
      SysCustomSettingType(
          opacity: json['Opacity'],
          cursorTheme: json['CursorTheme'],
          activeColor: json['ActiveColor'],
          standardFont: json['StandardFont'],
          monospaceFont: json['MonospaceFont'],
          sysTheme: json['SysTheme'],
          fontSize: json['FontSize']);

}
