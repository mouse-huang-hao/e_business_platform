import 'package:flutter/material.dart';

class MineList extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      child: Text("猜你喜欢",style: TextStyle(fontSize:15)),
      alignment: Alignment.center,
      color: const Color.fromARGB(253, 253, 245, 238),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
  
}