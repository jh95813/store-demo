import 'package:dbus/dbus.dart';
import 'package:store/dbus/dbus_register.dart';

class SysNotification {
   final dBus=dBusConfig;
   //发送系统消息
   Future<void> sendSysNotification(SysNotificationConfig config) async {
    var client = DBusClient.session();
    var object = DBusRemoteObject(client, dBus.sendSysNotification.name,
        DBusObjectPath(dBus.sendSysNotification.path));
    var values = [
      DBusString('deepin-app-store'), // App name
      DBusUint32(0), // Replaces
      DBusString(config.status==SysNotificationType.Success?'success':'success'), // Icon
      DBusString(config.status==SysNotificationType.Success?'安装成功':'卸载成功'), // Summary
      DBusString(config.status==SysNotificationType.Success?"${config.appName}安装成功":'${config.appName}卸载成功'), // Body
      DBusArray(DBusSignature('s')), // Actions
      DBusDict(DBusSignature('s'), DBusSignature('v')), // Hints
      DBusInt32(2000), // Expire timeout
    ];
    var result = await object.callMethod(
        dBus.sendSysNotification.interface, dBus.sendSysNotification.methods, values);
    var id = result.returnValues[0];
    print('notify ${id.toNative()}');
    await client.close();
   }
   Future<void> sysNotificationControl() async {
     print('打开消息控制中心');
     var client = DBusClient.session();
     var object = DBusRemoteObject(client, dBus.sysNotificationControl.name,
         DBusObjectPath(dBus.sysNotificationControl.path));
     await object.callMethod(
         dBus.sysNotificationControl.interface, dBus.sysNotificationControl.methods,[]);
     await client.close();
   }
 }

 class SysNotificationConfig{
    String appName;
    String title;
    String  subTitle;
    int timeout;
    SysNotificationType status;
    SysNotificationConfig(this.appName,this.status);
 }
 enum SysNotificationType{
  Error,
   Success,
   UnInstall
 }