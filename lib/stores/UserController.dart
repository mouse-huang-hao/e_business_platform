import 'package:e_business_platform/viewmodels/loginmodels.dart';
import 'package:get/get.dart';

class Usercontroller extends GetxController{
  var user = UserInfo.fromJSON({}).obs;
  upadeateUserInfo(UserInfo newuser){
    user.value=newuser;
  }
}