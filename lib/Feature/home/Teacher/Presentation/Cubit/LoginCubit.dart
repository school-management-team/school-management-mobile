import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;
  final String userStatus;

  LoginSuccess({
    required this.token,
    required this.userStatus,
  });
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({
    required this.errorMessage,
  });
}

class LoginCubit extends Cubit<LoginState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 
      //  "https://api-neo-academy.robooq.com/api/",
      
    "https://reawake-unlighted-scoff.ngrok-free.dev/api/",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
    
      final response = await _dio.post(
        'auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (kDebugMode) {
        print('LOGIN RESPONSE = ${response.data}');
      }

    final String? token =
    response.data['data']?['token'];

final int? userId =
    response.data['data']?['user']?['id'];

final String? userStatus =
    response.data['data']?['user']?['status'];

if (token == null || token.isEmpty) {
  emit(
    LoginFailure(
      errorMessage: 'فشل في استخراج التوكن من السيرفر',
    ),
  );
  return;
}

if (userId == null) {
  emit(
    LoginFailure(
      errorMessage: 'فشل في استخراج معرف المستخدم',
    ),
  );
  return;
}

if (userStatus == null || userStatus.isEmpty) {
  emit(
    LoginFailure(
      errorMessage: 'فشل في استخراج حالة الحساب',
    ),
  );
  return;
}

final prefs = await SharedPreferences.getInstance();

await prefs.setString('user_token', token);
await prefs.setInt('user_id', userId);
await prefs.setString('user_status', userStatus);

print('USER ID = $userId');
print('USER STATUS = $userStatus');

emit(
  LoginSuccess(
    token: token,
    userStatus: userStatus,
  ),
);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('STATUS CODE = ${e.response?.statusCode}');
        print('RESPONSE BODY = ${e.response?.data}');
      }

      final serverMessage =
          e.response?.data is Map
              ? (e.response?.data['message'] ??
                  e.response?.data['error'])
              : null;

      emit(
        LoginFailure(
          errorMessage:
              serverMessage?.toString() ??
              'حدث خطأ أثناء تسجيل الدخول',
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED ERROR = $e');
      }

      emit(
        LoginFailure(
          errorMessage: 'حدث خطأ غير متوقع',
        ),
      );
    }
  }
}