import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/core/data_logic.dart';

class MyLocal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        slivers: <Widget>[_buildSliverAppBar(), _buildSliverList()],
      ),
    );
  }

  Widget _buildSliverList() {
    return
      GetBuilder<DataLogic>(builder: (ctl) {
      var list = ctl.state.installedList;

      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (_, int i) => Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.description),
                ),
                Expanded(
                  child: Text(list[i].name),
                ),
                Expanded(
                  child: Text(list[i].size.toString()),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1.5, color: Color.fromRGBO(231, 233, 233, 1))),
            ),
          ),
        ),
        childCount: list.length,
      ));
    });
  }

  Widget _buildSliverAppBar() {

    return
      SliverAppBar(
      expandedHeight: 150,
      title:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text('本地列表'),

        ],
      ),

      actions: _buildActions(),
      elevation: 2,
      pinned: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
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

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  _SliverDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //孩子

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
