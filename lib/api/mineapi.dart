
import 'package:e_business_platform/constants/constans.dart';
import 'package:e_business_platform/utils/diorequest.dart';
import 'package:e_business_platform/viewmodels/homemodels.dart';

Future<GoodItems> getGuessAPI(Map<String,dynamic>params) async{
  return  GoodItems.fromJSON(await dioRequest.get(RequestInterface.GUESS,params: params));
}


