import 'package:go_router/go_router.dart';

import 'package:school/Feature/attendance_Management/presentation/view/management_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_alerts_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_attendance_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_dashboard_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_overview_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_schedule_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_staff_view.dart';
import 'package:school/Feature/home/Advisor/presentation/view/student_transfer_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/Login_View.dart';
import 'package:school/Feature/auth/signup/presentation/view/account_peneding.dart';
import 'package:school/Feature/auth/signup/presentation/view/role_selection_view.dart';

import 'package:school/Feature/auth/signup/presentation/view/signup_advisor_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_view.dart';

import 'package:school/Feature/home/Student/presentation/view/profile_student_page2.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/TaskandGradeMonitor_View.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/addnewtask_teacher_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/assignmentsandtasks_View.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/teacherdashboard_View.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page1_view.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page2_view.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page3_view.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page4_body.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page4_view.dart';
import 'package:school/Feature/home/Student/presentation/view/Dashboardst_view.dart';
import 'package:school/Feature/home/Student/presentation/view/WeekDaysSelector_view.dart';
import 'package:school/Feature/home/Student/presentation/view/dash2_view.dart';
import 'package:school/Feature/home/Student/presentation/view/freiendsinschool_view.dart';
import 'package:school/Feature/home/Student/presentation/view/gradecardst_view.dart';
import 'package:school/Feature/home/Student/presentation/view/tasksandhomework_view.dart';

abstract class AppRouter {
  static const klogin = '/LoginView';
  static const kforgotpass = '/ForgotPassView';
  static const kteacherdash = '/teacherdashview';
  static const kadmindashboard = '/AdminDashView';
  static const knewtaskteacher = '/addnewtaskteacherview';
  static const kassignmentandtasks = '/assignmentsschoolview';
  static const ktaskandgrademonitor = '/Taskandgradeview';

  static const kOnBoarding = '/';
  static const kOnBoarding1 = '/onboarding1';
  static const kOnBoarding2 = '/onboarding2';
  static const kOnBoarding3 = '/onboarding3';
  static const kOnBoarding4 = '/onboarding4';
  static const ksignupStud = '/signupstudview';
  static const kroleselection = '/roleselectionview';

  static const ksignupteacher = '/signupteacherview';
  static const ksignupadvisor = '/signupadvisorview';
  static const kaccountpendeing = '/accountpendeingview';
  static const kStudentDashboard = '/StudentDashboardview';
  static const kmanagementview = '/managementview';
  static const kprofileStudent = '/profileStudentview';
  static const kprofileStudentpage2 = '/kprofileStudentpage2view';

  static const kDashboardstudent = '/kDashboardstudentview';
  static const kDash2Student = '/kDash2Student';
  static const kFriendsStudent = '/kFriendsStudentView';
  static const kFWeekdaysselector = '/WeekdaysselectorView';
  static const kGradecardstStudent = '/kGradecardstStudentView';

  static const kTaskshomeworkStudent = '/kTaskshomeworkStudentview';
  static const kadvisordash = '/advisordashview';
  static const kadvisoralerts = '/advisoralertsview';
  static const kadvisorattendance = '/advisorattendanceview';
  static const kstudenttransfer = '/studenttransferview';
  static const kadvisoroverview = '/advisoroverviewview';
  static const kadvisorstaff = '/advisorstaffview';
  static const kadvisorschedule = '/advisorscheduleview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kadvisordash,
        builder: (context, state) => const AdvisorDashboardView(),
      ),
      GoRoute(
        path: kadvisoralerts,
        builder: (context, state) => const AdvisorAlertsView(),
      ),
      GoRoute(
        path: kadvisorattendance,
        builder: (context, state) => const AdvisorAttendanceView(),
      ),
      GoRoute(
        path: kstudenttransfer,
        builder: (context, state) => const StudentTransferView(),
      ),
      GoRoute(
        path: kadvisoroverview,
        builder: (context, state) => const AdvisorOverviewView(),
      ),
      GoRoute(
        path: kadvisorstaff,
        builder: (context, state) => const AdvisorStaffView(),
      ),
      GoRoute(
        path: kadvisorschedule,
        builder: (context, state) => const AdvisorScheduleView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) =>const OnBoardingPage1View()
          
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
        path: ksignupteacher,
        builder: (context, state) => const SignupTeacherView(),
      ),
      GoRoute(
        path: ksignupadvisor,
        builder: (context, state) => const SignupAdvisorView(),
      ),
      GoRoute(
        path: kteacherdash,
        builder: (context, state) => const teacherdashview(),
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
        /* path: kaccountpendeing,
        builder: (context, state) => const AccountPending(),*/
      ),
      GoRoute(
        path: kOnBoarding1,
        builder: (context, state) => const OnBoardingPage1View(),
      ),
      GoRoute(
        path: kOnBoarding2,
        builder: (context, state) => const OnBoardingPage2View(),
      ),
      GoRoute(
        path: kOnBoarding3,
        builder: (context, state) => const OnBoardingPage3View(),
      ),
      GoRoute(
        path: kOnBoarding4,
        builder: (context, state) => const OnBoardingPage4View(),
      ),
      GoRoute(
        path: ksignupStud,
        builder: (context, state) => const SignupStudView(),
      ),

      GoRoute(
        path: kaccountpendeing,
        builder: (context, state) => const AccountPending(),
      ),

      GoRoute(
        path: kDashboardstudent,
        builder: (context, state) => const DashboardstView(),
      ),
      GoRoute(
        path: kroleselection,
        builder: (context, state) => const RoleSelectionView(),
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

      GoRoute(
        path: kFriendsStudent,
        builder: (context, state) => const FreiendsinschoolView(),
      ),
      GoRoute(
        path: kDash2Student,
        builder: (context, state) => SchoolCalendarScreen(),
      ),
      GoRoute(
        path: kFWeekdaysselector,
        builder: (context, state) => WeekdaysselectorView(),
      ),
      GoRoute(
        path: kGradecardstStudent,
        builder: (context, state) => GradecardstView(),
      ),
      GoRoute(
        path: kTaskshomeworkStudent,
        builder: (context, state) => TasksandhomeworkView(),
      ),

      GoRoute(path: klogin, builder: (context, state) => const LoginView()),
    ],
  );
}
