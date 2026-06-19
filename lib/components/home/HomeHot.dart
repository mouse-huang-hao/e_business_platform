import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeHot extends StatefulWidget {
  final RecommendationResult result;
  final String type;

  HomeHot({Key? key, required this.result, required this.type}) : super(key: key);

  @override
  _HomeHotState createState() => _HomeHotState();
}

class _HomeHotState extends State<HomeHot> {
  List<GoodsItem> get _items{
    if(widget.result.subTypes.isEmpty)return [];
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }
  List<Widget>  _displayGoodsItems(){
    return _items.map((item){
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                item.picture,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset("lib/assets/LingJun2.jpg",width: 80,height: 100,fit: BoxFit.cover,),)
              ),
              SizedBox(height: 5,),
              Text("￥${item.price}",
              style:TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 86, 24, 20),
                fontWeight: FontWeight.bold,
              )
              )
            ],
          )        
      );
    }).toList();
  }

  Widget _getHeader(){
    return Row(
      children: [
        Text(
          widget.type=="step"?"一站买全":"爆款推荐",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10,),
        Text(widget.type=="step"?"精心优选":"最受欢迎",
        style: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 124, 63, 58)
          ),),



    ],);
  }





  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type=="step"
          ?Color.fromARGB(255, 249, 247, 219)
          :Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            _getHeader(),
            SizedBox(height: 10,),
            Row(
              children: _displayGoodsItems(),
            ),
          ],
        ),
      );
  }
}