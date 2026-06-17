import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> _bannerList;
  HomeSlider({Key? key,required this._bannerList}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Widget _getSlider(){
    return CarouselSlider(items: List.generate(widget._bannerList.length, (index) =>Image.network(widget._bannerList[index].imgUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)), options: CarouselOptions(autoPlay: true));
  }








  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider()      ],
    );
  }
}