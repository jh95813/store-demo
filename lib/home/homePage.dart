import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:store_app/home/searchBar.dart';
import 'package:store_app/model/category_list_entity.dart';
import 'package:store_app/widgets/load_image.dart';

import 'avatar.dart';
import 'cateGoryList.dart';

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
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 220,
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10, right: 5),
                                  child: Container(
                                    height:100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(231, 233, 233, 1)),
                                  )),
                            ),

                            Expanded(
                              flex: 5,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, top: 10, bottom: 10, right: 10),
                                  child: Container(
                                    height:100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(231, 233, 233, 1)),
                                  )),
                            )
                          ],
                        );
                        LoadImage('avatar');
                      },
                      itemCount: 3,
                      itemWidth: MediaQuery.of(context).size.width,
                      pagination: new SwiperPagination(),
                      control: new SwiperControl(),
                    ),
                  )
                ],
              )
            ],
          ))
        ])));
  }
}
