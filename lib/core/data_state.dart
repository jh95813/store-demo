import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store/model/category_list_entity.dart';

import 'moke_data.dart';

class DataState{
  //列表模拟数据
  RxList<MokeModelEntity> dataList;
  //已安装列表数据
  // ignore: deprecated_member_use
  final RxList<MokeModelEntity> installedList=new List<MokeModelEntity>().obs;
  //首页左侧列表数据
  List<CategoryModelEntity> homeLeftMenu = <CategoryModelEntity>[
    CategoryModelEntity("首页推荐", "home", 'icon'),
    CategoryModelEntity("下载排行", "download", 'icon'),
    CategoryModelEntity("我的应用", "my", 'icon')
  ];
  //首页左侧active菜单索引
  final homeMenuIndex=0.obs;
  initPackageData(){
    dataList=mokeModelEntityFromJson(mokeJson).obs;
    print(dataList.length);
  }
}