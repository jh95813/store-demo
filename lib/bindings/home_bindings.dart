import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:store/core/data_logic.dart';
import 'package:store/widgets/list/appl_list_logic.dart';
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DataLogic>(DataLogic(), permanent: true);

  }
}