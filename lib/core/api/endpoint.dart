class ApiEndpoint {
  static String urlbase = "https://reawake-unlighted-scoff.ngrok-free.dev/api/";

  static String signupStudent = "auth/register/student";
  static String signupTeacher = "auth/register/teacher";

  static String stages = "stages";

static String login="auth/login";
  static String subjects(int stageId) => "stages/$stageId/subjects";



  static String classgroupStudent="student/class-group";
  static String classmateStudent="student/classmates";
 static String assignmentsprogressStudent="student/assignments/progress";
 static String assignmentswithstatusStudent="student/assignments/with-status";
   static String complete(int assignmentId) =>
      " student/assignments/$assignmentId/complete";
 
}
class ApiKey {
  static String errormessage = "message";
  static String status = "status";



  static String token="token";
}

