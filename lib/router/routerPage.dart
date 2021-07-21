import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/widgets/home/home.dart';
import 'package:store/widgets/home/homePage.dart';
import 'package:store/widgets/setting/setting.dart';

class RouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 150,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white, // 底色
              boxShadow: [
                BoxShadow(
                  blurRadius: 3, //阴影范围
                  spreadRadius: 1, //阴影浓度
                  color: Colors.grey, //阴影颜色
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset('assets/images/icon.svg'),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text('深度应用商店'),
                )),
                Container(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 40),child: SizedBox(width: 30,height: 30,child:  Icon(Icons.account_circle_outlined,color: Colors.black,),),),
                      SizedBox(width: 30,child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.remove),
                      ),),
                      SizedBox(width: 30,child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.fullscreen),
                      ),),
                      SizedBox(width: 30,child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.remove),
                      ),),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Navigator(
            // Navigator
            initialRoute: '/abc',
            onGenerateRoute: (val) {
              RoutePageBuilder builder;
              switch (val.name) {
                case '/abc':
                  builder = (BuildContext nContext, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      HomePage();
                  break;
                case '/settings':
                  builder = (BuildContext nContext, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      HomePage();
                  break;
                default:
                  builder = (BuildContext nContext, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      HomePage();
              }
              return PageRouteBuilder(
                pageBuilder: builder,
                // transitionDuration: const Duration(milliseconds: 0),
              );
            },
            // onUnknownRoute: (val) {
            //   return '/abc';
            // },
            observers: <NavigatorObserver>[]));
  }
}
