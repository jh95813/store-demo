
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store/model/app_list_entity.dart';

class AppListState{
  final RxBool pageLoad=false.obs;
  List<AppListEntity> appPageList=[];
}