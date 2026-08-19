import 'package:dio/dio.dart';
import 'package:school/core/database/cache/cahe_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await CacheHelper().getDataString(key: 'token') ?? '';
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
handler.next(options);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    //super.onRequest(options, handler);

   // handler.next(options);
  }
}
