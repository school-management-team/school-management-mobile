import 'package:school/core/api/endpoint.dart';

class ModelErrors {
  String errorMessage;
  int status;

  ModelErrors({
    required this.errorMessage,
    required this.status,
  });

  factory ModelErrors.fromJson(dynamic jsonData) {
    if (jsonData is Map<String, dynamic>) {
      return ModelErrors(
        errorMessage:
            jsonData[ApiKey.errormessage]?.toString() ??
            'حدث خطأ',
        status:
            int.tryParse(
              jsonData[ApiKey.userStatus]?.toString() ?? '',
            ) ??
            0,
      );
    }

    if (jsonData is String) {
      return ModelErrors(
        errorMessage: jsonData,
        status: 0,
      );
    }

    return ModelErrors(
      errorMessage: 'حدث خطأ غير معروف',
      status: 0,
    );
  }
}