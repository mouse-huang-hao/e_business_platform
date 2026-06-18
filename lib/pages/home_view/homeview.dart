import 'package:e_business_platform/api/homeapi.dart';
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
  List<BannerItem>_bannerList=[];
  List<CategoryItem>_categoryList=[];
  RecommendationResult _recommendationResult=RecommendationResult(
    id: '',
    title: '',
    subTypes: [],
  );
  List<Widget> _getslivers(){
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeRecommendation(recommendationResult: _recommendationResult)),
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
  void initState() { 
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getRecommendationList();

  }


  void _getBannerList()async{
    _bannerList=  await getBannerListAPI();
    setState(() {
      
    });
  }
  void _getCategoryList()async{
    _categoryList=  await getCategoryListAPI();
    setState(() {
      
    });
  }
  void _getRecommendationList()async{
    _recommendationResult= await getRecommendationListAPI();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getslivers(),
    );
    
  }
}



