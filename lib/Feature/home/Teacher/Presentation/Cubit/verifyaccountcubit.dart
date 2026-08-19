import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class VerifyAccountState {}

final class VerifyAccountInitial extends VerifyAccountState {}

final class VerifyAccountLoading extends VerifyAccountState {}

final class VerifyAccountSuccess extends VerifyAccountState {
  final String message;
  final String? token;

  VerifyAccountSuccess({required this.message, this.token});
}

final class VerifyAccountFailure extends VerifyAccountState {
  final String errorMessage;

  VerifyAccountFailure({required this.errorMessage});
}

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reawake-unlighted-scoff.ngrok-free.dev/api/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  VerifyAccountCubit() : super(VerifyAccountInitial());

  Future<void> verifyCode({required String email, required String code}) async {
    emit(VerifyAccountLoading());

    final Map<String, dynamic> requestBody = {'email': email, 'code': code};

    if (kDebugMode) {
      print('==== VERIFY ACCOUNT REQUEST ====');
      print('URL: ${_dio.options.baseUrl}auth/verify-account');
      print('Body: $requestBody');
    }

    try {
      final response = await _dio.post(
        'auth/verify-account',
        data: requestBody,
      );

      if (kDebugMode) {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.data}');
      }

      final String message =
          response.data['message'] ?? 'تم تأكيد الحساب بنجاح';
      final String? token =
          response.data['token'] ?? response.data['data']?['token'];

      if (token != null && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', token);
      }

      emit(VerifyAccountSuccess(message: message, token: token));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Status Code: ${e.response?.statusCode}');
        print('Response Body: ${e.response?.data}');
      }

      String errorMsg = 'رمز التحقق غير صحيح';

      if (e.response?.data is Map && e.response?.data['message'] != null) {
        errorMsg = e.response?.data['message'];
      } else if (e.response?.data is Map &&
          e.response?.data['errors'] != null) {
        final errors = e.response?.data['errors'] as Map;
        if (errors.isNotEmpty) {
          final firstVal = errors.values.first;
          if (firstVal is List && firstVal.isNotEmpty) {
            errorMsg = firstVal.first.toString();
          }
        }
      }

      emit(VerifyAccountFailure(errorMessage: errorMsg));
    } catch (e) {
      if (kDebugMode) {
        print('Verify Unexpected Error: $e');
      }
      emit(VerifyAccountFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}
