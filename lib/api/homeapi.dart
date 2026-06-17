import 'package:e_business_platform/constants/constans.dart';
import 'package:e_business_platform/utils/diorequest.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';

Future<List<BannerItem>> getBannerListAPI()async{
  return( (await dioRequest.get(RequestInterface.BANNER))as List).map((item){
    return BannerItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}