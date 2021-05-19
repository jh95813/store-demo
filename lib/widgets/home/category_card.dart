import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data_logic.dart';
import 'package:store/core/moke_data.dart';
import 'package:store/model/category_card_entity.dart';

class CategoryCard extends StatelessWidget {

  final DataLogic dataLogic = Get.find<DataLogic>();

  RxList<MokeModelEntity> _cardData;
  CategoryCardEntity _cardParams =
      new CategoryCardEntity('我们喜欢的App和游戏', 'like');
  List<Widget> buildGird() {
    _cardData = dataLogic.state.dataList;
     List<Widget> item = [cardTitle()];
    for (var i = 0; i < _cardData.length; i += 2) {
      item.add(list(i));
    }
     return item;
  }
  void startInstall(int index){
    dataLogic.listUpdate(index);
  }
  Widget cardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _cardParams.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Text(
          '查看全部',
          style: TextStyle(
            color: Color.fromRGBO(30, 144, 244, 1),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      buildGird()
   ,

    );
  }

  Widget list(int index) {
    return  GetBuilder<DataLogic>(
      id: 'counter',
      builder: (ctl) => Row(
        children: <Widget>[
          Expanded(
              child: ListTile(
                  leading: Icon(Icons.print),
                  title: Text(ctl.state.dataList[index].name),
                  subtitle: Text(ctl.state.dataList[index].tag.toString()),
                  trailing: MaterialButton(
                    padding: EdgeInsets.all(0),
                    textColor: Color(0xffFfffff),
                    elevation: 3,
                    color: Colors.blue,
                    highlightColor: Color(0xffF88B0A),
                    splashColor: Colors.red,
                    child:
                    ctl.state.dataList[index].installed ? Text('已安装') : Text('获取'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onLongPress: () => {},
                    onPressed: () => {
                      startInstall(index),
                    },
                  ))),
          Expanded(
              child: index + 1 <= _cardData.length
                  ? ListTile(
                  leading: Icon(Icons.print),
                  title: Text(ctl.state.dataList[index+1].name),
                  subtitle: Text(ctl.state.dataList[index+1].tag.toString()),
                  trailing: MaterialButton(
                    padding: EdgeInsets.all(0),
                    textColor: Color(0xffFfffff),
                    elevation: 3,
                    color: Colors.blue,
                    highlightColor: Color(0xffF88B0A),
                    splashColor: Colors.red,
                    child:   ctl.state.dataList[index+1].installed ? Text('已安装') : Text('获取'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onLongPress: () => {},
                    onPressed: () => {
                      startInstall(index+1),
                    },
                  ))
                  : Text('')),
        ],
      ),
    );


  }
}
