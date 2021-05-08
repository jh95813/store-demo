import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLocal extends StatelessWidget{
  final data = List.generate(128, (i) => Color(0xFF6600FF - 2 * i));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Text('sss')
    );
  }

  Widget _buildSliverList() => SliverGrid.extent(
    childAspectRatio: 1 / 0.618,
    maxCrossAxisExtent: 180,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    children: data
        .map((e) => Container(
      alignment: Alignment.center,
      width: 100,
      height: 60,
      color: e,
      child: Text(
        colorString(e),
        style: TextStyle(color: Colors.white, shadows: [
          Shadow(
              color: Colors.black,
              offset: Offset(.5, .5),
              blurRadius: 2)
        ]),
      ),
    ))
        .toList(),
  );

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 190.0,

      title: Text('张风捷特烈'),
      actions: _buildActions(),
      elevation: 5,
      pinned: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
        background: Image.asset(
          "assets/images/caver.webp",
          fit: BoxFit.cover,
        ),
      ),
    );
  }



  List<Widget> _buildActions() => <Widget>[
    IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.star_border,
        color: Colors.white,
      ),
    )
  ];

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";


}

