
import 'package:flutter/material.dart';

class HomeGoodsList extends StatefulWidget {
  HomeGoodsList({Key? key}) : super(key: key);

  @override
  _HomeGoodsListState createState() => _HomeGoodsListState();
}

class _HomeGoodsListState extends State<HomeGoodsList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (BuildContext context,int index){
      return Container();
    });
  }
}