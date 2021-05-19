import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/model/setting_entity.dart';
import 'package:store/router/router.dart';
import 'package:store/widgets/setting/setting_logic.dart';

class SettingPage extends StatelessWidget {
  final initSettingCtr=Get.put(SettingLogic());
  final logic=Get.find<SettingLogic>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            child: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Get.toNamed(RouteConfig.main);
            },
          ),
          title: Text('${Get.arguments}跳转至设置'),
          centerTitle: true,
        ),
        body: GetBuilder<SettingLogic>(builder: (ctr)=>
         ListView.builder(
              itemCount: ctr.menuList.length,
              itemBuilder: (itemBuilder, i) {
                var item = ctr.menuList[i];
                return ListTile(
                  title: Text(item.name),
                  trailing:Switch(
                    value: ctr.menuList[i].checked,
                    onChanged: (value) {
                      logic.listUpdate(i, value);
                    },

                  ),
                );
              })
       )

    );
  }
}
