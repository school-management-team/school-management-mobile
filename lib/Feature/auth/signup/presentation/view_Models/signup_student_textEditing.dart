import 'package:flutter/material.dart';

class SignupStudentTextediting {
  final TextEditingController brithdayController =
      TextEditingController();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController fatherNameController =
      TextEditingController();

  final TextEditingController motherNameController =
      TextEditingController();

  final TextEditingController gradeController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController configePasswordController =
      TextEditingController();

  final TextEditingController departmentController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController genderController =
      TextEditingController(text: 'ذكر');

  int? selectedClassId;

  void dispose() {
    brithdayController.dispose();
    nameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    gradeController.dispose();
    passwordController.dispose();
    configePasswordController.dispose();
    departmentController.dispose();
    phoneController.dispose();
    emailController.dispose();
    genderController.dispose();
  }
}