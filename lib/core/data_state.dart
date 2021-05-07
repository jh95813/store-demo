import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'moke_data.dart';

class DataState{
  RxList<MokeModelEntity> dataList;
  initPackageData(){
    dataList=mokeModelEntityFromJson(mokeJson).obs;
  }
}