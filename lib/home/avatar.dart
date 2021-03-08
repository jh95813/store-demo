import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomAvatar extends StatelessWidget {
  static const double _imageSize = 40.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 40,height: 40,child: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png'),radius: 100,),),
        Padding(padding: EdgeInsets.only(left: 10),child:  Text('靓仔',style:TextStyle(fontWeight: FontWeight.w700),),),
      ],
    );
  }
}
