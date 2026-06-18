import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeRecommendation extends StatefulWidget {
  final RecommendationResult recommendationResult;
  HomeRecommendation({Key? key, required this.recommendationResult}) : super(key: key);

  @override
  _HomeRecommendationState createState() => _HomeRecommendationState();
}

class _HomeRecommendationState extends State<HomeRecommendation> {
  List<GoodsItem> _getGoodsItems(){
    if(widget.recommendationResult.subTypes.isEmpty)return [];
    return widget.recommendationResult.subTypes.first.goodsItems.items.take(3).toList();
  }
  List<Widget> _displayGoodsItems(){
    List<GoodsItem> list = _getGoodsItems();
    return List.generate(list.length, (index)  {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(list[index].picture,width: 100,height: 140,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Image.asset("lib/assets/LingJun1.jpg",width: 100,height: 140,fit: BoxFit.cover,),)
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 240, 96, 12)
            ),
            child: Text("￥${list[index].price}",style: TextStyle(color: Colors.white),),
          )
          
        ],
      );
    });

  }



  Widget _getHeader(){
    return Row(
      children: [
        Text("特惠推荐",
        style: TextStyle(
          color: Color.fromARGB(255, 86, 24, 20),
          fontSize: 18,
          fontWeight: FontWeight.w700
        )),
        SizedBox(width: 10),
        Text("精选省攻略",
        style: TextStyle(
          color: Color.fromARGB(255, 124, 63, 58),
          fontSize: 12,
        ),        
        )
      ],
    );
  }

  Widget _getLeftPicture(){
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("lib/assets/Kapibala.jpg"),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),image: DecorationImage(image: AssetImage("lib/assets/LingJun8.jpg"),fit: BoxFit.cover,opacity: 0.5)),
        child: Column(
          children: [
            _getHeader(),
            SizedBox(height: 10,),
            Row(children: [
              _getLeftPicture(),
              SizedBox(width: 10,),
              Expanded(child: Row(children: _displayGoodsItems(),mainAxisAlignment: MainAxisAlignment.spaceEvenly,))
            ],crossAxisAlignment: CrossAxisAlignment.start,)
          ],
        ),
      ),   
    );
  }
}