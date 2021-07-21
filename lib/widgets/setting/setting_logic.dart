import 'package:get/get.dart';
import 'package:store/dbus/sys_notification.dart';
import 'package:store/model/setting_entity.dart';

class SettingLogic extends GetxController{
  final menuList=[
    SettingList('打开控制中心', SettingItemType.ControlCenter, false),
    SettingList('打开控制中心', SettingItemType.Login, false)
  ].obs;
  void listUpdate(int index,bool value){
    var item=menuList[index];
    var newItem=SettingList(item.name, item.type, value);
    menuList[index]=newItem;
    update();
    if(value){
      SysNotification().sysNotificationControl();
    }
  }
}