
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeGoodsList extends StatefulWidget {
  final List<Good>goodsList;
  final bool isLoading;
  final bool hasMore;
  HomeGoodsList({Key? key,required this.goodsList, this.isLoading = false, this.hasMore = true}) : super(key: key);

  @override
  _HomeGoodsListState createState() => _HomeGoodsListState();
}

class _HomeGoodsListState extends State<HomeGoodsList> {
  Widget _displayGoods(int index){
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.goodsList[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Image.asset("assets/LingJun6.png");
                },
                ),
              ),
            ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.goodsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10), 
          itemBuilder: (BuildContext context,int index){
            return _displayGoods(index);
          },
        ),
        if (widget.isLoading)
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (!widget.isLoading && !widget.hasMore)
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text('没有更多数据了'),
            ),
          ),
      ]),
    );
  }
}