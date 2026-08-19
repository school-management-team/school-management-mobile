import 'package:dio/dio.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dashboardmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardRepo {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://reawake-unlighted-scoff.ngrok-free.dev/api/",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Dashboardmodel> getDashBoardData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('user_token');

    if (token == null || token.isEmpty) {
      throw Exception('لم يتم العثور على جلسة دخول، يرجى تسجيل الدخول مجدداً');
    }

    try {
      final response = await _dio.get(
        'teacher/dashboard',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print('Response Data: ${response.data}');

      return Dashboardmodel.fromJson(response.data);
    } on DioException catch (e) {
      print('Dio Error Status Code: ${e.response?.statusCode}');
      print('Dio Error Response: ${e.response?.data}');
      throw Exception(e.response?.data['message'] ?? 'حدث خطأ في الاتصال');
    } catch (e, stackTrace) {
      print('Parsing Error: $e');
      print('StackTrace: $stackTrace');
      throw Exception('خطأ في تحويل البيانات: $e');
    }
  }
}
