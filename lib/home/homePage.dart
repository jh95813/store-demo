import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/home/searchBar.dart';
import 'package:store/model/category_list_entity.dart';
import 'avatar.dart';
import 'cateGoryList.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  void onChanged(CategoryModelEntity value) {
    print(value.label);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Container(
              width: 220,
              decoration: BoxDecoration(
                color: Color.fromRGBO(231, 233, 233, 1), // 底色
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3, //阴影范围
                    spreadRadius: 1, //阴影浓度
                    color: Colors.grey, //阴影颜色
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: [
                    SearchBar(),
                    Expanded(
                        child: CategoryList(
                      callback: (v) => onChanged(v),
                    )),
                    CustomAvatar()
                  ],
                ),
              )),
            Home()
        ])));
  }
}
