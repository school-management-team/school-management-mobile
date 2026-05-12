
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/account_peneding.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_student_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_body_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_view.dart';

abstract class AppRouter {
  static const ksignupTeacher='/signupTeacherView';

   static const ksignupStudent='/signupstudentview';
    static const kaccountpendeing='/accountpendeingview';
 static final router =GoRouter(
  routes:[

     GoRoute(
        path:'/',
        builder: (context, state) =>const SignupTeacherView(), 
      ),
      GoRoute(
        path:ksignupStudent,
        builder: (context, state) =>const SignupStudentView(), 
      ),  GoRoute(
        path:kaccountpendeing,
        builder: (context, state) =>const AccountPending(), 
      ),
       
       
      
     
  ]
      
      
      
      );
}