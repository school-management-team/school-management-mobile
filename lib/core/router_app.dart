import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/account_peneding.dart';
import 'package:school/Feature/auth/signup/presentation/view/role_selection_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_student_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_view.dart';
import 'package:school/Feature/home/presentation/view/AdminDashboard_View.dart';
import 'package:school/Feature/home/presentation/view/StudentDashboard_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/Login_View.dart';
import 'package:school/Feature/auth/signup/presentation/view/forgotpass_View.dart';
import 'package:school/Feature/home/presentation/view/TaskandGradeMonitor_View.dart';
import 'package:school/Feature/home/presentation/view/addnewtask_teacher_body.dart';
import 'package:school/Feature/home/presentation/view/addnewtask_teacher_view.dart';
import 'package:school/Feature/home/presentation/view/assignmentsandtasks_View.dart';
import 'package:school/Feature/home/presentation/view/teacherdashboard_View.dart';

abstract class AppRouter {
  static const ksignupStud = '/signupstudentview';
  static const kroleselection = '/roleselectionview';
  static const ksignupStudent = '/signupstudentview';
  static const ksignupteacher = '/signupteacherview';
  static const kaccountpendeing = '/accountpendeingview';
  static const kStudentDashboard = '/StudentDashboardview';
  // static const ksignupStudent = '/signupstudentview';
  // static const kaccountpendeing = '/accountpendeingview';
  static const klogin = '/LoginView';
  static const kforgotpass = '/ForgotPassView';
  static const kteacherdash = '/teacherdashview';
  static const kadmindashboard = '/AdminDashView';
  static const knewtaskteacher = '/addnewtaskteacherview';
  static const kassignmentandtasks = '/assignmentsschoolview';
  static const ktaskandgrademonitor = '/Taskandgradeview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const teacherdashview()),
      GoRoute(
        path: ksignupStudent,
        builder: (context, state) => const SignupStudentView(),
      ),
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
        path: kassignmentandtasks,
        builder: (context, state) => const assignmentsschoolview(),
      ),
      GoRoute(
        path: ktaskandgrademonitor,
        builder: (context, state) => const Taskandgradeview(),
      ),
      GoRoute(
        path: knewtaskteacher,
        builder: (context, state) => const addnewtaskteacherview(),
      ),
    ],
  );
}

// GoRoute(path: klogin, builder: (context, state) => const LoginView()),
