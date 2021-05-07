import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/moke_data.dart';

import 'package:store/dbus/sys_custom_setting.dart';
import 'package:store/home/searchBar.dart';
import 'package:store/model/category_list_entity.dart';
import 'avatar.dart';
import 'cateGoryList.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  final sysConfig=new SysCustomSetting();
  void onChanged(CategoryModelEntity value) {

  }
  Future<void> getSysConfig() async{
     final result =await sysConfig.getSysCustomSetting();
      Get.changeTheme(result.sysTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
              child: Home(),
            ),
          )
        ])));
  }
}
