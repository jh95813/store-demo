import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/model/category_card_entity.dart';

class CategoryCard extends StatelessWidget{
  List<CardListEntity> _cardData=[new CardListEntity(1, 'Just Focus', '效率', 'icon'),
    new CardListEntity(1, '网易云音乐', '音乐', 'icon'),
    new CardListEntity(2, '剪映专业版', '视频创作', 'icon'),
    new CardListEntity(3, 'djay - DJ应用&混音器', '混合音乐', 'icon'),
    new CardListEntity(4, 'Things', '效率', 'icon'),
    new CardListEntity(5, '钉钉', '阿里巴巴旗下办公平台', 'icon'),
  ];
  CategoryCardEntity _cardParams=new CategoryCardEntity('我们喜欢的App和游戏','like');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _cardParams.title,
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              '查看全部',
              style: TextStyle(
                color: Color.fromRGBO(30, 144, 244, 1),
              ),
            )
          ],
        ),
        Row(
          children:<Widget> [

            Expanded(
                child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text('Just Foncus'),
                    subtitle: Text('效率'),
                    trailing: MaterialButton(
                      padding: EdgeInsets.all(0),
                      textColor: Color(0xffFfffff),
                      elevation: 3,
                      color: Colors.blue,
                      highlightColor: Color(0xffF88B0A),
                      splashColor: Colors.red,
                      child: Text('获取'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onLongPress: () =>  {},
                      onPressed: () => {},
                    ))),
            Expanded(
                child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text('Just Foncus'),
                    subtitle: Text('效率'),
                    trailing: MaterialButton(
                      padding: EdgeInsets.all(0),
                      textColor: Color(0xffFfffff),
                      elevation: 3,
                      color: Colors.blue,
                      highlightColor: Color(0xffF88B0A),
                      splashColor: Colors.red,
                      child: Text('获取'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onLongPress: () =>  {},
                      onPressed: () => {},
                    ))),
          ],
        ),
        Row(
          children: [

            Expanded(
                child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text('Just Foncus'),
                    subtitle: Text('效率'),
                    trailing: MaterialButton(
                      padding: EdgeInsets.all(0),
                      textColor: Color(0xffFfffff),
                      elevation: 3,
                      color: Colors.blue,
                      highlightColor: Color(0xffF88B0A),
                      splashColor: Colors.red,
                      child: Text('获取'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onLongPress: () =>  {},
                      onPressed: () => {},
                    ))),
            Expanded(
                child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text('Just Foncus'),
                    subtitle: Text('效率'),
                    trailing: MaterialButton(
                      padding: EdgeInsets.all(0),
                      textColor: Color(0xffFfffff),
                      elevation: 3,
                      color: Colors.blue,
                      highlightColor: Color(0xffF88B0A),
                      splashColor: Colors.red,
                      child: Text('获取'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onLongPress: () =>  {},
                      onPressed: () => {},
                    ))),
          ],
        )
      ],
    );
  }

}