class ApiEndpoint {
  static String urlbase =
      "https://reawake-unlighted-scoff.ngrok-free.dev/api/";

  static String signupStudent = "auth/register/student";
  static String signupTeacher = "auth/register/teacher";

  static String stages = "stages";

  static String subjects(int stageId) =>
      "stages/$stageId/subjects";
}

class ApiKey {
  static String errormessage = "message";
  static String status = "status";
}