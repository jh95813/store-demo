import 'package:store/bindings/home_bindings.dart';
import 'package:store/widgets/home/homePage.dart';
import 'package:get/get.dart';
import 'package:store/widgets/setting/setting.dart';
class RouteConfig{
  ///主页面
  static final String main = "/";
  static final String setting = "/setting";
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage()),
    GetPage(name: setting, page: () => SettingPage(),binding: HomeBinding(),),
  ];
}