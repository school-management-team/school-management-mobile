import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/serverException.dart';

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
  final DioConsumer dioConsumer;

  ForgotPasswordCubit({required this.dioConsumer}) : super(ForgotPasswordInitial());

  Future<void> sendResetRequest({required String emailOrPhone}) async {
    emit(ForgotPasswordLoading());
    try {
      final response = await dioConsumer.post(
        ApiEndpoint.forgotPassword,
        data: {
          'email': emailOrPhone,
        },
      );

      emit(ForgotPasswordSuccess(
        message: response['message'] ?? 'تم إرسال تعليمات الاستعادة بنجاح',
      ));
    } on ServerException catch (e) {
      emit(ForgotPasswordFailure(
        errorMessage: e.modelErrors.errorMessage,
      ));
    } catch (e) {
      emit(ForgotPasswordFailure(
        errorMessage: e.toString(),
      ));
    }
  }
}