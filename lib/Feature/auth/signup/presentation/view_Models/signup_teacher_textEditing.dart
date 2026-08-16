import 'package:flutter/material.dart';

class SignupTeacherTextediting {
  final TextEditingController brithdayController =
      TextEditingController();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController subjectController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController configePasswordController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController genderController =
      TextEditingController();

  final TextEditingController cvController =
      TextEditingController();

  int? selectedStageId;
  int? selectedSubjectId;

  void dispose() {
    cvController.dispose();
    genderController.dispose();
    brithdayController.dispose();
    nameController.dispose();
    subjectController.dispose();
    passwordController.dispose();
    configePasswordController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }
}