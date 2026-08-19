import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;
  ForgotPasswordSuccess({required this.message});
}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;
  ForgotPasswordFailure({required this.errorMessage});
}

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api-neo-academy.robooq.com/api',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  Future<void> sendResetRequest({required String emailOrPhone}) async {
    emit(ForgotPasswordLoading());

    try {
      final response = await _dio.post(
        '/auth/forgot-password',
        data: {'email_or_phone': emailOrPhone},
      );

      final String message =
          response.data['message'] ??
          'تم إرسال كلمة السر الجديدة إلى بريدك الإلكتروني';

      emit(ForgotPasswordSuccess(message: message));
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data['message'] ?? 'حدث خطأ أثناء إرسال الطلب';
      emit(ForgotPasswordFailure(errorMessage: errorMsg));
    } catch (e) {
      emit(ForgotPasswordFailure(errorMessage: e.toString()));
    }
  }
}
