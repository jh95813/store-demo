import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/core/data_logic.dart';
import 'package:store/model/category_list_entity.dart';
import 'package:get/get.dart';
class CategoryList extends StatefulWidget {
  CategoryList({Key key, this.setIndex, this.callback}) : super(key: key);
  final CategoryModelEntity setIndex;
  final callback;
  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final dataLogic=Get.find<DataLogic>();

  int _index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var menu=dataLogic.state.homeLeftMenu;
    return ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int i) {
          var item = menu[i];
          return GestureDetector(
            onTap: () {
              widget.callback(i);
              setState(() => _index = i);
            },
            child: Container(
                decoration: new BoxDecoration(
                    color:
                        _index == i ? Color.fromRGBO(206, 207, 207, 1) : null,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(6.0))),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 5.0, right: 10.0, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 3.0,
                                ),
                                child: Icon(
                                  Icons.star_border,
                                  size: 17,
                                  color: Color.fromRGBO(30, 144, 244, 1),
                                ),
                              ),
                              Text(
                                item.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(56, 56, 56, 1)),
                              ),
                            ],
                          ),
                        ),
                        item.value=='my'?Container(
                          width: 20.0,
                          height: 20.0,
                          child: CircleAvatar(
                            child: Obx(()=>Text(
                              dataLogic.state.installedList.length.toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(56, 56, 56, 1),fontWeight: FontWeight.w900),
                            ),),
                            backgroundColor: Color.fromRGBO(181, 181, 183, 1),
                          ),
                        ):Text(''),
                      ],
                    ))),
          );
        });
  }
}
