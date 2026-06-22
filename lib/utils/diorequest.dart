import 'package:dio/dio.dart';
import 'package:e_business_platform/constants/constans.dart';
import 'package:e_business_platform/stores/TokenManager.dart';

class DioRequest{
  final _dio = Dio();
  DioRequest(){
    _dio.options..baseUrl = GlobalConstants.BASE_URL
    ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
    ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
    ..receiveTimeout =  Duration(seconds: GlobalConstants.TIME_OUT);
    _addInterceptor();
  
  }
  void _addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if(tokenManager.getToken().isNotEmpty){
          options.headers = {
            "Authorization": "Bearer ${tokenManager.getToken()}"
          };
        }
        handler.next(options);

      },
      onResponse: (response, handler) {
        if(response.statusCode!>=200&&response.statusCode!<300){
        handler.next(response);
        return;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));

      },
      onError: (error, handler) {
        handler.reject(DioException(requestOptions: error.requestOptions,message: error.response?.data["msg"]??" "));
      },
    )
    );
  }
  Future<dynamic> get (String url,{Map<String,dynamic>?params}){
    return _handleResponse(_dio.get(url,queryParameters: params));
  }

  Future<dynamic> post(String url,{Map<String,dynamic>?data} ){
    return _handleResponse(_dio.post(url,data:data));
  }


  Future<dynamic> _handleResponse(Future<Response<dynamic>> task)async{
    try{
      Response<dynamic> res=await task;
      final data=  res.data as Map<String,dynamic>;
      if(data["code"]==GlobalConstants.SUCCESS_CODE){
        return data["result"];
      }
      throw DioException(requestOptions: res.requestOptions,message:data["msg"]??"加载数据异常");
    }catch(e){
      rethrow;
    }
  }  
}


final dioRequest = DioRequest();