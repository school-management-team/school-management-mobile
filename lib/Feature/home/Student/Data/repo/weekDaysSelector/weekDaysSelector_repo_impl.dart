import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo.dart';
import 'package:school/core/api/errors/Failure.dart';

class WeekdaysselectorRepoImpl implements WeekdaysselectorRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getDailySchedule() async {
    try {
      List<Map<String, dynamic>> sehedule = [
        {
              "session": "الحصة الأولى",
              "title": "الرياضيات المتقدمة",
              "time": "08:00",
              "status": "current",
              "teacher": "أحمد الصالح",
              "room": "قاعة 302",
        },
        {
              "session": "الحصة الثانية",
              "title": "اللغة الإنجليزية",
              "time": "09:15",
              "status": "upcoming",
              "teacher": "بيان يوسف",
              "room": "قاعة 205",
      },{
              "session": "",
              "title": "",
              "time": "15 دقيقة",
              "status": "break",
              "teacher": "",
              "room": "",
      },
       {   
              "session": "الحصة الثالثة",
              "title": "الفيزياء النووية",
              "time": "10:45",
              "status": "upcoming",
              "teacher": "خالد العبيد",
              "room": "قاعة 101",
       },
      ];
    
    Map<String ,dynamic> responseData={
  "schedule":sehedule,
  "remaining_hours":"4",
  "completion_percentage":"70%",
    };
      return right(responseData);
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }
}
