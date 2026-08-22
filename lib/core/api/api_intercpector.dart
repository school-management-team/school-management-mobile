import 'package:dio/dio.dart';
import 'package:school/core/database/cache/cahe_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {

    final token = await CacheHelper().getDataString(key: 'user_token') ?? '';
    
  
    print("DEBUG: Interceptor trying to get token with key 'user_token'");
    print("DEBUG: Retrieved token is: $token");

  
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      print("Authorization header added successfully!");
    } else {
      print("WARNING! No token found in CacheHelper!");
    }

    handler.next(options);
  }
}