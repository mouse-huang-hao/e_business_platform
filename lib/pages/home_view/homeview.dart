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
  RecommendationResult _hotRecommendationResult = RecommendationResult(
    id: '',
    title: '',
    subTypes: [],
  );

  RecommendationResult _hotRecommendationResultRelated =  RecommendationResult(
    id: '',
    title: '',
    subTypes: [],
  );

  List<Good>_goodsList=[];
  
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: HomeHot(result: _hotRecommendationResult, type:"hot")),
              SizedBox(width: 10),
              Expanded(child: HomeHot(result: _hotRecommendationResultRelated, type:"step"))
            ],
        ))),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeGoodsList(goodsList: _goodsList,),
    ];
  }
  Future<void> _refresh()async{
    _page=1;
    _isThereaNextPage=true;
    _isLoading=false;
    await _getBannerList();
    await _getCategoryList();
    await _getRecommendationList();
    await _getHotRecommendationList();
    await _getHotRecommendationRelatedList();
    await _getGoodsList();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),content: Text("刷新完成",textAlign: TextAlign.center,),width: 120,behavior: SnackBarBehavior.floating,));
    setState(() {
    
    });
  }



  @override
  void initState() { 
    super.initState();
    // _getBannerList();
    // _getCategoryList();
    // _getRecommendationList();
    // _getHotRecommendationList();
    // _getHotRecommendationRelatedList();
    // _getGoodsList();
    _registerScrollController();
    Future.microtask((){
      _refreshIndicatorKey.currentState?.show();
    });
  }

  void _registerScrollController(){
    _scrollController.addListener((){
      if (_scrollController.position.pixels>=_scrollController.position.maxScrollExtent){
        _getGoodsList();
      }

    });
  }



  Future<void> _getBannerList()async{
    _bannerList=  await getBannerListAPI();

  }
  Future<void> _getCategoryList()async{
    _categoryList=  await getCategoryListAPI();

  }
  Future<void> _getRecommendationList()async{
    _recommendationResult= await getRecommendationListAPI();
 
  }
  Future<void> _getHotRecommendationList()async{
    _hotRecommendationResult= await getHotRecommendationListAPI();
   
  }
  Future<void> _getHotRecommendationRelatedList()async{
    _hotRecommendationResultRelated= await getHotRecommendationRelatedListAPI();
    
  }

int _page = 1;
bool _isLoading = false;
bool _isThereaNextPage = true;
Future<void> _getGoodsList()async{
  if(_isLoading|| !_isThereaNextPage){
    return;
    }
  _isLoading=true;
  _goodsList= await getGoodsListAPI({"limit":8*_page});
  _isLoading=false;
  setState(() {
    
  });
  
  if(_goodsList.length<8*_page){
    _isThereaNextPage=false;
    return;
  }
  _page++;
}

final ScrollController _scrollController=ScrollController();
final GlobalKey<RefreshIndicatorState>_refreshIndicatorKey=GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: ()async{
        await _refresh();
      },
      
      child: CustomScrollView(
        controller: _scrollController,
        slivers: _getslivers(),
      )
    );
  }
}



