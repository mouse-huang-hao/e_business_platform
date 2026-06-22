import 'package:e_business_platform/constants/constans.dart';
import 'package:e_business_platform/utils/diorequest.dart';
import 'package:e_business_platform/viewmodels/loginmodels.dart';

Future<UserInfo> loginAPI(Map<String,dynamic>data) async{
  return UserInfo.fromJSON(
    await dioRequest.post(RequestInterface.LOGIN,data: data)
  );
}

Future<UserInfo> getUserInfoAPI()async{
  return UserInfo.fromJSON(
    await dioRequest.get(RequestInterface.USER_PROFILE)
  );
}