import 'package:dbus/dbus.dart';
import 'package:store/dbus/dbus_register.dart';

class SysNotification {
   final dBus=dBusConfig;
   Future<void> sendSysNotification(sysNotificationType config) async {
    var client = DBusClient.session();
    var object = DBusRemoteObject(client, dBus.sendSysNotification.name,
        DBusObjectPath(dBus.sendSysNotification.path));
    var values = [
      DBusString('deepin-app-store'), // App name
      DBusUint32(0), // Replaces
      DBusString('success'), // Icon
      DBusString('安装成功!'), // Summary
      DBusString('某某应用安装成功'), // Body
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

 class sysNotificationType{
    String appName;
    String title;
    String  subTitle;
    int timeout;
    sysNotificationType(this.appName,this.title,this.subTitle,this.timeout);
 }