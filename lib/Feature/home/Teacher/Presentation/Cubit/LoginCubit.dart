import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess({required this.token});
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

class LoginCubit extends Cubit<LoginState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reawake-unlighted-scoff.ngrok-free.dev/api/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await _dio.post(
        'auth/login',
        data: {'email': email, 'password': password},
      );

      final String? token =
          response.data['token'] ?? response.data['data']?['token'];

      if (token != null && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', token);

        emit(LoginSuccess(token: token));
      } else {
        emit(LoginFailure(errorMessage: 'فشل في استخراج التوكن من السيرفر'));
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(' Status Code: ${e.response?.statusCode}');
        print('Response Body: ${e.response?.data}');
      }

      final serverMessage = e.response?.data is Map
          ? (e.response?.data['message'] ?? e.response?.data['error'])
          : null;

      final errorMsg = serverMessage ?? 'حدث خطأ أثناء تسجيل الدخول';

      emit(LoginFailure(errorMessage: errorMsg));
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected Error: $e');
      }
      emit(LoginFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}
