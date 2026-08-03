import 'package:dio/dio.dart';
import 'package:school/core/api/errors/model_errors.dart';

class ServerException implements Exception {
  final ModelErrors modelErrors;
  ServerException({required this.modelErrors});
}

void HandelDioException(DioException e) {
  if(e.response!=null){
    throw ServerException(modelErrors: ModelErrors.fromJson(e.response!.data));
  }
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );

    case DioExceptionType.sendTimeout:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );

    case DioExceptionType.cancel:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        modelErrors: ModelErrors.fromJson(e.response!.data),
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        case 401:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );

        case 403:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        case 404:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        case 409:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        case 422:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        case 504:
          throw ServerException(
            modelErrors: ModelErrors.fromJson(e.response!.data),
          );
        default:
          throw ServerException(
            modelErrors: ModelErrors(errorMessage: "error",status: 0),
          );
      }
    case DioExceptionType.transformTimeout:
      throw UnimplementedError();
  }
}
