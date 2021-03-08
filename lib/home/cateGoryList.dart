import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/model/category_list_entity.dart';


class CategoryList extends StatefulWidget{
  CategoryList({Key key,this.setIndex,this.callback}) : super(key: key);
  final CategoryModelEntity setIndex;
  final  callback;
  @override
  State<StatefulWidget> createState() => _CategoryListState();

}

class _CategoryListState extends State<CategoryList>{
  List<CategoryModelEntity> _nav = <CategoryModelEntity>[
    CategoryModelEntity("首页推荐", "home", "test"),
    CategoryModelEntity("下载排行", "download", "test"),
  ];

  int _index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _nav.length,
        itemBuilder: (BuildContext context, int i) {
          return

            GestureDetector(
                onTap: () {
                  widget.callback(CategoryModelEntity(_nav[i].label, _nav[i].value, _nav[i].icon));
                  setState(() => _index = i);
                },
                child: Container(
                    decoration: new BoxDecoration(
                        color: _index == i ? Color.fromRGBO(206, 207, 207, 1) : null,
                        borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
                child:Padding(
                    padding: EdgeInsets.only(
                        left: 5.0, right: 10.0, top: 8, bottom: 8),
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
                          _nav[i].label,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),
                        ),
                      ],
                    ))),
          );
        });
  }
}
