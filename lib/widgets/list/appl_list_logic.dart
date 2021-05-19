import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:store/model/app_list_entity.dart';
import 'package:store/widgets/list/app_list_state.dart';

class AppListLogic extends GetxController{
  final state=AppListState();
  final appApiString='https://professional-store.chinauos.com/api/public/app';
  final dio=Dio();
  Future<void> getList() async {
    state.pageLoad.value=false;
    Future.delayed(Duration(seconds: 0),() async {
      try {
        var  idRes = await dio.get<String>('https://professional-store.chinauos.com/api/public/stat?order=download&ranking=ranking&offset=0&limit=40&arch=amd64&mode=desktop&platform=professional&region=CN&language=zh&display=x11&client_version=6.0.0.8&product_name=');
        var idList=downloadListEntityFromJson(idRes.data.toString());
        var str='';
        for(var i=0;i<idList.length;i++){
          var item=idList[i];
          str=str+'id=${item.appId}&';
        }
        var appRes =await dio.get<String>('${appApiString}?${str}limit=40&active=true&arch=amd64&mode=desktop&platform=professional&region=CN&language=zh&display=x11&client_version=6.0.0.8&product_name=');
        var appList=appOriginListEntityFromJson(appRes.data.toString());
        List<AppListEntity> list=[];
        appList.forEach((e){
          var item=e.info.locales[0];
          list.add(AppListEntity(id:e.id,icon:item.icon,cover: item.cover,description: item.description,tags: item.tags,slogan: item.slogan,screenshots: item.screenshots,name:item.name)) ;
        });
        state.appPageList=list;
        update();
        state.pageLoad.value=true;

      } catch (e) {
        print(e);
      }
    });

  }
  @override
  void onReady() {

    super.onReady();
  }
}