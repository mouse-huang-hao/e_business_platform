
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeGoodsList extends StatefulWidget {
  final List<Good>goodsList;
  HomeGoodsList({Key? key,required this.goodsList}) : super(key: key);

  @override
  _HomeGoodsListState createState() => _HomeGoodsListState();
}

class _HomeGoodsListState extends State<HomeGoodsList> {
  Widget _displayGoods(int index){
    return Container(
      // margin: EdgeInsets.all(5),
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
          SizedBox(height: 6,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.goodsList[index].name,
              style: TextStyle(fontSize:12,color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              )
            ),
            SizedBox(height: 6,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "¥${widget.goodsList[index].price}",
                      style: TextStyle(fontSize:12,color: Colors.black,fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(text: " "),
                        TextSpan(
                          text: "${widget.goodsList[index].price}",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 8
                          )
                        )
                      ]
                    ),
                  ),
                  Text(
                    "${widget.goodsList[index].payCount}人付款",
                    style: TextStyle(color: Colors.grey,fontSize: 10),
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                  )                   
                ],
              ),
            )  
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: widget.goodsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75
          ), 
        itemBuilder: (BuildContext context,int index){
          return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child:   _displayGoods(index)
           );
        },
      );
  }
}