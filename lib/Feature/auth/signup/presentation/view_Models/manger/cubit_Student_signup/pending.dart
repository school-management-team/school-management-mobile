import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:school/core/api/endpoint.dart';



sealed class AccountStatusState {}

final class AccountStatusInitial extends AccountStatusState {}

final class AccountStatusLoading extends AccountStatusState {}

final class AccountStatusPending extends AccountStatusState {}

final class AccountStatusActive extends AccountStatusState {}

final class AccountStatusFailure extends AccountStatusState {
  final String errorMessage;

  AccountStatusFailure(this.errorMessage);
}


class AccountStatusCubit extends Cubit<AccountStatusState> {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoint.urlbase,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  AccountStatusCubit()
      : super(AccountStatusInitial());



  Future<void> checkStatus(int userId) async {

    try {

      final response = await _dio.get(
        ApiEndpoint.status(userId),
      );

      if (kDebugMode) {
        print("=================================");
        print("ACCOUNT STATUS");
        print("USER ID = $userId");
        print("STATUS CODE = ${response.statusCode}");
        print("RESPONSE = ${response.data}");
        print("=================================");
      }


  

      final String? status =
          response.data['data']?['status'] ??
          response.data['status'] ??
          response.data['user_status'];


      if (status == null || status.isEmpty) {

        emit(
          AccountStatusFailure(
            "فشل في استخراج حالة الحساب",
          ),
        );

        return;
      }



      if (status.toLowerCase() == 'active') {

        final prefs =
            await SharedPreferences.getInstance();

        await prefs.setString(
          ApiKey.userStatus,
          'active',
        );

        emit(AccountStatusActive());

        return;
      }



      await SharedPreferences.getInstance()
          .then(
            (prefs) => prefs.setString(
              ApiKey.userStatus,
              status,
            ),
          );

      emit(AccountStatusPending());

    } on DioException catch (e) {

      if (kDebugMode) {
       
      }

      emit(
        AccountStatusFailure(
          e.response?.data?['message']?.toString() ??
              "حدث خطأ أثناء التحقق من حالة الحساب",
        ),
      );

    } catch (e) {

      if (kDebugMode) {
        print("ACCOUNT STATUS UNEXPECTED ERROR = $e");
      }

      emit(
        AccountStatusFailure(
          "حدث خطأ غير متوقع",
        ),
      );
    }
  }
}