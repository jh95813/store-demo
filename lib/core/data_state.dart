import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store/model/category_list_entity.dart';
import 'package:store/widgets/list/app_list.dart';
import 'package:store/widgets/home/home.dart';
import 'package:store/widgets/my_local/my_local.dart';

import 'moke_data.dart';

class DataState{
  RxBool init=false.obs;
  //列表模拟数据
  // ignore: deprecated_member_use
  var dataList=mokeModelEntityFromJson(mokeJson).obs;
  //已安装列表数据
  // ignore: deprecated_member_use
  final installedList=<MokeModelEntity>[].obs;
  //首页左侧列表数据
  List<CategoryModelEntity> homeLeftMenu = <CategoryModelEntity>[
    CategoryModelEntity("首页推荐", "home", 'icon',Home()),
    CategoryModelEntity("下载排行", "download", 'icon',AppList()),
    CategoryModelEntity("我的应用", "my", 'icon',MyLocal())
  ];
  //首页左侧active菜单索引
  final homeMenuIndex=0.obs;
  //图片域名
  final imgPath='https://professional-store.chinauos.com/api/public/blob/';

}