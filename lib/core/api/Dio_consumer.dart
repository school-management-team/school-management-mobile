import 'package:dio/dio.dart';
import 'package:school/core/api/api_consumer.dart';
import 'package:school/core/api/api_intercpector.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/serverException.dart';

class DioConsumer extends ApiConsumer {
  DioConsumer(this.dio) {
 
    dio.options.baseUrl = ApiEndpoint.urlbase;

    dio.options.connectTimeout =
        const Duration(seconds: 30);

    dio.options.sendTimeout =
        const Duration(seconds:30);

    dio.options.receiveTimeout =
        const Duration(seconds: 30);

 
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestUrl: true,
        responseUrl: true,
      ),
    );
  }

  final Dio dio;

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    bool isFromData = false,
     Options? options,
  }) async {
    try {
      final respone = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return respone.data;
    } on DioException catch (e) {
      HandelDioException(e);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    bool isFromData = false,
     Options? options,
  }) async {
    try {
      final respone = await dio.get(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return respone.data;
    } on DioException catch (e) {
      HandelDioException(e);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    bool isFromData = false,
     Options? options,
  }) async {
    try {
      final respone = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return respone.data;
    } on DioException catch (e) {
      HandelDioException(e);
    }
  }
@override
Future<dynamic> post(
  String path, {
  dynamic data,
  Map<String, dynamic>? query,
  bool isFromData = false,
  Options? options,
}) async {
  try {
    print('URL = ${dio.options.baseUrl}$path');
    print('DATA = $data');

    final response = await dio.post(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: query,
      options: options,
    );

    print('STATUS = ${response.statusCode}');
    print('RESPONSE = ${response.data}');

    return response.data;
  } on DioException catch (e) {
    print('POST ERROR = $e');
    HandelDioException(e);
    
  }
}
}
