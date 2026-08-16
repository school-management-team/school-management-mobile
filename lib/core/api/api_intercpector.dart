import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept']='application/json';
    options.headers['Content-Type']= 'application/json';
      
      handler.next(options);
 

  }
}
