import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store/widgets/list/appl_list_logic.dart';

class AppList extends StatelessWidget {
  final test=Get.put<AppListLogic>(AppListLogic());
  final appLogic = Get.find<AppListLogic>();
  final data = List.generate(128, (i) => Color(0xFF6600FF - 2 * i));
  var hoverId=0.obs;
  @override
  Widget build(BuildContext context) {

    var loading = appLogic.state.pageLoad;
    appLogic.getList();
    return Obx(() => loading.value
        ? Container(
            height: MediaQuery.of(context).size.height,
            child: CustomScrollView(
              slivers: <Widget>[_buildSliverAppBar(), _buildSliverList()],
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  child: SpinKitWave(color: Colors.blue, size: 30.0),
                ),
                Text('Loading...'),
              ],
            )),
          ));
  }

  Widget _buildSliverList() {
var list=appLogic.state.appPageList;
    return SliverGrid.extent(
      childAspectRatio: 1 / 0.618,
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: list
          .map((e) =>MouseRegion(child:Container(
          alignment: Alignment.center,
          width: 80,
          height: 60,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                // LoadImage("https://professional-store.chinauos.com/api/public/blob/cd0070ac-116f-4a4b-8d56-9d2720b85206",width: 40.0,height: 40.0,),
                SvgPicture.network(
                  "https://professional-store.chinauos.com/api/public/blob/${e.icon}",
                  semanticsLabel: 'A shark?!',
                  placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()),
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(e.name.toString(),maxLines: 1,),
                      Row(
                        children: [
                          Expanded(child: Text('sss')),
                          Obx(()=>hoverId.value==e.id? SizedBox(
                              width: 40,
                              height: 20,
                              child:TextButton(onPressed: (){},child: Text('安装'),style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blue,),)
                          ):Text(''))

                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),onHover: (PointerEvent details){
            hoverId.value=e.id;
      },)

      )
          .toList(),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 100.0,
      title: Text('下载排行'),
      actions: _buildActions(),
      elevation: 5,
      pinned: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
      ),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          onPressed: () {
            // appLogic.getList();
          },
          icon: Icon(
            Icons.star_border,
            color: Colors.white,
          ),
        )
      ];

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}
