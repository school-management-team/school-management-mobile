class ApiEndpoint {
  static String urlbase =
      //  "https://api-neo-academy.robooq.com/api/";
      "https://reawake-unlighted-scoff.ngrok-free.dev/api/";

  static String signupStudent = "auth/register/student";
  static String signupTeacher = "auth/register/teacher";

  static String stages = "stages";

  static String login = "auth/login";
  static String subjects(int stageId) => "stages/$stageId/subjects";

  static String classgroupStudent = "student/class-group";
  static String classmateStudent = "student/classmates";
  static String assignmentsprogressStudent = "student/assignments/progress";
  static String assignmentswithstatusStudent =
      "student/assignments/with-status";
  static String complete(int assignmentId) =>
      "student/assignments/$assignmentId/complete";

  static String DailySchdule = "student/schedule/daily";

  static String status(int userId) => "auth/status/$userId";

  static String announcementsupcoming = 'student/announcements/upcoming';
  static String announcementsimportantdates =
      "student/announcements/important-dates";
  static String studentDashboard = "student/dashboard";
  static String studentGrades = "student/grades";
  static String studentProfile = "student/profile-page";
  static String  studentAttendanceSummary="student/attendance-summary";
  static String guardian ="student/guardian-info";
  static String  updateStudentProfileImage="profile/photo";
  
  static const String forgotPassword = 'auth/forgot-password';
static const String resetPassword = 'auth/reset-password';
static const String resendCode = 'auth/resend-code';

}

class ApiKey {
  static String errormessage = "message";
  static String userStatus = "user_status";
  static String userid = "user_id";
  static String token = "token";
}
