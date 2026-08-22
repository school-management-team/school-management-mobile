import 'package:dio/dio.dart';
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

final class ResendCodeLoading extends VerifyAccountState {}

final class ResendCodeSuccess extends VerifyAccountState {
  final String message;
  ResendCodeSuccess({required this.message});
}

final class ResendCodeFailure extends VerifyAccountState {
  final String errorMessage;
  ResendCodeFailure({required this.errorMessage});
}

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://reawake-unlighted-scoff.ngrok-free.dev/api/",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  VerifyAccountCubit() : super(VerifyAccountInitial());

  Future<void> verifyCode({required String email, required String code}) async {
    emit(VerifyAccountLoading());
    try {
      final response = await _dio.post('auth/verify-account', data: {'email': email, 'code': code});
      final String message = response.data['message'] ?? 'تم تأكيد الحساب بنجاح';
      final String? token = response.data['token'] ?? response.data['data']?['token'];
      if (token != null && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', token);
      }
      emit(VerifyAccountSuccess(message: message, token: token));
    } on DioException catch (e) {
      String errorMsg = 'رمز التحقق غير صحيح';
      if (e.response?.data is Map && e.response?.data['message'] != null) {
        errorMsg = e.response?.data['message'];
      }
      emit(VerifyAccountFailure(errorMessage: errorMsg));
    } catch (e) {
      emit(VerifyAccountFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }

  Future<void> resendCode({required String email}) async {
    emit(ResendCodeLoading());
    try {
      final response = await _dio.post('auth/resend-code', data: {'email': email});
      final String message = response.data['message'] ?? 'تم إرسال رمز التحقق بنجاح';
      emit(ResendCodeSuccess(message: message));
    } on DioException catch (e) {
      String errorMsg = 'فشل إعادة إرسال الرمز';
      if (e.response?.data is Map && e.response?.data['message'] != null) {
        errorMsg = e.response?.data['message'];
      }
      emit(ResendCodeFailure(errorMessage: errorMsg));
    } catch (e) {
      emit(ResendCodeFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}