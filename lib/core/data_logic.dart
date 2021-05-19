import 'package:get/get.dart';
import 'package:store/core/data_state.dart';
import 'package:store/dbus/sys_notification.dart';

import 'moke_data.dart';

class DataLogic extends GetxController {
  final state = DataState();
  final sysNotification=SysNotification();
  install(MokeModelEntity value) {
    sysNotification.sendSysNotification(SysNotificationConfig(value.name,SysNotificationType.Success));
    state.installedList.add(value);
  }
  unInstall(MokeModelEntity value) {
    var installedList = state.installedList;
    sysNotification.sendSysNotification(SysNotificationConfig(value.name,SysNotificationType.UnInstall));
    installedList.removeWhere((v) => v.id==value.id);

  }
  listUpdate(index) {
    final list = state.dataList;
    var item = state.dataList[index];
    final newItem = MokeModelEntity(
        id: item.id,
        name: item.name,
        installed: !item.installed,
        icon: 'icon',
        tag: item.tag,
        installStatus: item.installStatus,
      size: item.size
    );
    state.dataList[index] = newItem;
    //根据添加删除处理本地列表数据
    if (!item.installed) {
      install(newItem);
    } else {
      unInstall(newItem);
    }
    update(['counter']);
    //修改数据 list需要调用refresh否则view监听不到
    //class类需要update();例如 user=User({name:"张三"}).obs,更新User类 user.update({name:“李四”})
    list.refresh();
  }

  @override
  void onReady() {
    state.init.value=true;
    super.onReady();
  }
}
