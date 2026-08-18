import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String email;
  final String password;
  final String passwordConfirmation;
  final String userName;
  final String phone;
  final String gender;
  final String birthDate;
  final String fatherName;
  final String motherName;
  final int classId;

  const Register({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.userName,
    required this.phone,
   required this.gender,
    required this.birthDate,
    required this.fatherName,
    required this.motherName,
    required this.classId,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    email: json['email'] as String,
    password: json['password'] as String,
    passwordConfirmation: json['password_confirmation'] as String,
    userName: json['user_name'] as String,
    phone: json['phone'] as String,
    gender: json['gender'] as String,
    birthDate: json['birth_date'] as String,
    fatherName: json['father_name'] as String,
    motherName: json['mother_name'] as String,
    classId: json['class_id'] as int,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'user_name': userName,
    'phone': phone,
    'gender': gender,
    'birth_date': birthDate,
    'father_name': fatherName,
    'mother_name': motherName,
    'class_id': classId,
  };

  @override
  List<Object?> get props {
    return [
      email,
      password,
      passwordConfirmation,
      userName,
      phone,
      gender,
      birthDate,
      fatherName,
      motherName,
      classId,
    ];
  }
}
