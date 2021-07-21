import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data_logic.dart';
import 'package:store/dbus/sys_custom_setting.dart';
import 'package:store/widgets/home/searchBar.dart';
import 'package:store/widgets/my_local/my_local.dart';
import 'package:store/widgets/setting/setting.dart';
import 'avatar.dart';
import 'cateGoryList.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  final sysConfig = new SysCustomSetting();

  final dataLogic = Get.find<DataLogic>();

  void onChanged(int index) {
    var homeIndex = dataLogic.state.homeMenuIndex;
    homeIndex.value = index;
  }

  Future<void> getSysConfig() async {
    final result = await sysConfig.getSysCustomSetting();
    Get.changeTheme(result.sysTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Container(
              width: 220,
              decoration: BoxDecoration(
                color: Color.fromRGBO(231, 233, 233, 1), // 底色
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3, //阴影范围
                    spreadRadius: 1, //阴影浓度
                    color: Colors.grey, //阴影颜色
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: [
                    SearchBar(),
                    Expanded(
                        child: CategoryList(
                      callback: (v) => onChanged(v),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAvatar(),
                        IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () => {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                          return SettingPage();//返回的是需要跳转单页面
                          },))
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width - 220,
            child: SingleChildScrollView(
              child:Obx((){
                var homeIndex=dataLogic.state.homeMenuIndex;
                var cageGoryMenu=dataLogic.state.homeLeftMenu;
                if(homeIndex.value>=0){
                  return cageGoryMenu[homeIndex.value].page;
                }

                return Home();
              }),
            ),
          )
        ])));
  }
}
