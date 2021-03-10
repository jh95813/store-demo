import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:store/home/category_card.dart';
import 'package:store/widgets/load_image.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  SwiperController _controller = new SwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          children: [
            Container(
                height: 240,
                width: MediaQuery.of(context).size.width - 220,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 25.0,
                      child: GestureDetector(
                        onTap: () => {
                          setState(() => {_controller.previous()})
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 270,
                      child: buildCustomSwiper(context),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 25.0,
                      child: GestureDetector(
                        onTap: () => {
                          setState(() => {_controller.next()})
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
          child: Divider(
            height: 1.0,
            indent: 0.0,
            color: Color.fromRGBO(231, 233, 233, 1),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
          child:CategoryCard()

        ),
      ],
    ));
  }

  Swiper buildCustomSwiper(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 40.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '必备精选',
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 141, 141, 1),
                                    fontSize: 10.0),
                              ),
                              Text(
                                '学霸工具箱',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('更努力学习，有App更轻松',
                                  style: TextStyle(
                                      color: Color.fromRGBO(141, 141, 141, 1))),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                          radius: 100,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(231, 233, 233, 1),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(12.0))),
                  )),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '必备精选',
                              style: TextStyle(
                                  color: Color.fromRGBO(141, 141, 141, 1),
                                  fontSize: 10.0),
                            ),
                            Text(
                              '学霸工具箱',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            Text('更努力学习，有App更轻松',
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 141, 141, 1))),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 100,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(231, 233, 233, 1),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(12.0))),
                ),
              ),
            )
          ],
        );
        LoadImage('avatar');
      },
      itemCount: 3,
      itemWidth: MediaQuery.of(context).size.width,
      controller: _controller,
    );
  }
}
