final dBusConfig = DBusConfig(
    //发送消息通知
    sendSysNotification: DBusObject(
        name: 'org.freedesktop.Notifications',
        path: '/org/freedesktop/Notifications',
        interface: 'org.freedesktop.Notifications',
        methods: 'Notify'),
    //打开控制中心
    sysNotificationControl: DBusObject(
        name: 'org.freedesktop.Notifications',
        path: '/org/freedesktop/Notifications',
        interface: 'com.deepin.dde.Notification',
        methods: 'Toggle'),
    sysCustomConfig:DBusObject(
        name: 'com.deepin.daemon.Appearance',
        path: '/com/deepin/daemon/Appearance',
        interface: 'com.deepin.daemon.Appearance',
        methods: '')
);

class DBusConfig {
  DBusObject sendSysNotification;
  DBusObject sysNotificationControl;
  DBusObject sysCustomConfig;
  DBusConfig({this.sendSysNotification, this.sysNotificationControl,this.sysCustomConfig});
}

class DBusObject {
  String name; //dbus名称
  String path; //dbus path路径
  String interface; //dbus命名空间interface
  String methods; //dbus命名空间下对应方法名称
  DBusObject({this.name, this.path, this.interface, this.methods});
}
