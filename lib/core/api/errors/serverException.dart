import 'package:dio/dio.dart';
import 'package:school/core/api/errors/model_errors.dart';

class ServerException implements Exception {
  final ModelErrors modelErrors;
  ServerException({required this.modelErrors});
}
void HandelDioException(DioException e) {

  if (e.response != null) {
    final statusCode = e.response!.statusCode;

    switch (statusCode) {
      case 400:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 401:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 403:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 404:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 409:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 422:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 500:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 502:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 503:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      case 504:
        throw ServerException(
          modelErrors: ModelErrors.fromJson(
            e.response!.data,
          ),
        );

      default:
        throw ServerException(
          modelErrors: ModelErrors(
            errorMessage: 'حدث خطأ في الخادم',
            status: statusCode ?? 0,
          ),
        );
    }
  }


  String message;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      message = 'انتهت مهلة الاتصال بالخادم';
      break;

    case DioExceptionType.sendTimeout:
      message = 'انتهت مهلة إرسال البيانات';
      break;

    case DioExceptionType.receiveTimeout:
      message = 'انتهت مهلة استقبال البيانات';
      break;

    case DioExceptionType.connectionError:
      message = 'تعذر الاتصال بالخادم';
      break;

    case DioExceptionType.badCertificate:
      message = 'مشكلة في شهادة الاتصال';
      break;

    case DioExceptionType.cancel:
      message = 'تم إلغاء الطلب';
      break;

    case DioExceptionType.unknown:
      message = 'حدث خطأ غير معروف';
      break;

    case DioExceptionType.badResponse:
      message = 'استجابة غير صحيحة من الخادم';
      break;

    case DioExceptionType.transformTimeout:
      message = 'انتهت مهلة معالجة البيانات';
      break;
  }

  throw ServerException(
    modelErrors: ModelErrors(
      errorMessage: message,
      status: 0,
    ),
  );
}