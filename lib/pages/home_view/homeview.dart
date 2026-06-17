import 'package:e_business_platform/components/home/HomeCategory.dart';
import 'package:e_business_platform/components/home/HomeGoodsList.dart';
import 'package:e_business_platform/components/home/HomeHot.dart';
import 'package:e_business_platform/components/home/HomeRecommendation.dart';
import 'package:e_business_platform/components/home/HomeSlider.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(id: "1",imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg" ),
    BannerItem(id: "2",imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"),
    BannerItem(id: "3",imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg")
  ];
  List<Widget> _getslivers(){
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeRecommendation()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child:Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HomeHot()),
              SizedBox(width: 10),
              Expanded(child: HomeHot())
            ],
        ))),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeGoodsList()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getslivers(),
    );
    
  }
}



