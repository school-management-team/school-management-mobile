import 'package:go_router/go_router.dart';
import 'package:school/Feature/attendance_Management/presentation/view/management_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/account_peneding.dart';
import 'package:school/Feature/auth/signup/presentation/view/role_selection_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_student_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_view.dart';
import 'package:school/Feature/home/Student/presentation/view/StudentDashboard_view.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_page2.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_view.dart';

abstract class AppRouter {
  static const ksignupStud = '/signupstudentview';
  static const kroleselection = '/roleselectionview';
  static const ksignupStudent = '/signupstudentview';
  static const ksignupteacher = '/signupteacherview';
  static const kaccountpendeing = '/accountpendeingview';
  static const kStudentDashboard = '/StudentDashboardview';
  static const kmanagementview = '/managementview';
  static const kprofileStudent = '/profileStudentview';
  static const kprofileStudentpage2='/kprofileStudentpage2view';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SignupStudView()),
      GoRoute(
        path: ksignupStudent,
        builder: (context, state) => const SignupStudentView(),
      ),
      GoRoute(
        path: kaccountpendeing,
        builder: (context, state) => const AccountPending(),
      ),

      GoRoute(
        path: kroleselection,
        builder: (context, state) => const RoleSelectionView(),
      ),
      GoRoute(
        path: kStudentDashboard,
        builder: (context, state) => const StudentdashboardView(),
      ),
      GoRoute(
        path: ksignupteacher,
        builder: (context, state) => const SignupTeacherView(),
      ),
      GoRoute(
        path: kmanagementview,
        builder: (context, state) => const ManagementView(),
      ),

      GoRoute(
        path: kprofileStudent,
        builder: (context, state) => const ProfileStudentView(),
      ),
      
      GoRoute(
        path: kprofileStudentpage2,
        builder: (context, state) => const ProfileStudentPage2(),
      ),
    ],
  );
}
