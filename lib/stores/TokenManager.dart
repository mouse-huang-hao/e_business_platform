
import 'package:e_business_platform/constants/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tokenmanager {
  Future<SharedPreferences> _getInstance(){
    return  SharedPreferences.getInstance();
  }
  String _token = "";
  init ()async{
    final  prefs =await  _getInstance();
    _token= prefs.getString(GlobalConstants.TOKEN_KEY)??"";
  }
  Future<void> setToken(String val)async{
    final  prefs =await  _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY,val);
    _token=val;
  }
  String getToken(){
    return _token;
  }
  removeToken()async{
    final prefs =await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token="";
  }
}

final tokenManager = Tokenmanager();