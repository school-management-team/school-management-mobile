import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/serverException.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final DioConsumer dioConsumer;

  ResetPasswordCubit({required this.dioConsumer}) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(ResetPasswordLoading());
    try {
      final response = await dioConsumer.post(
        ApiEndpoint.resetPassword,
        data: {
          'email': email,
          'code': code,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      emit(ResetPasswordSuccess(
        message: response['message'] ?? 'تم تغيير كلمة المرور بنجاح',
      ));
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(
        errorMessage: e.modelErrors.errorMessage,
      ));
    } catch (e) {
      emit(ResetPasswordFailure(
        errorMessage: e.toString(),
      ));
    }
  }
}