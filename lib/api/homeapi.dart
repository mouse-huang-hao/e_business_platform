import 'package:e_business_platform/constants/constans.dart';
import 'package:e_business_platform/utils/diorequest.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';

Future<List<BannerItem>> getBannerListAPI()async{
  return( (await dioRequest.get(RequestInterface.BANNER))as List).map((item){
    return BannerItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI()async{
  return( (await dioRequest.get(RequestInterface.CATEGORY))as List).map((item){
    return CategoryItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}

Future<RecommendationResult> getRecommendationListAPI()async{
  return RecommendationResult.fromJSON(await dioRequest.get(RequestInterface.RECOMMENDATION));
}

Future<RecommendationResult> getHotRecommendationListAPI()async{
  return RecommendationResult.fromJSON(await dioRequest.get(RequestInterface.HOT_RECOMMENDATION));
}

Future<RecommendationResult> getHotRecommendationRelatedListAPI()async{
  return RecommendationResult.fromJSON(await dioRequest.get(RequestInterface.HOT_RECOMMENDATION_RELATED));
}

Future<List<Good>> getGoodsListAPI()async{
  return( (await dioRequest.get(RequestInterface.Goods))as List).map((item){
    return Good.fromJSON(item as Map<String,dynamic>);
  }).toList();
}