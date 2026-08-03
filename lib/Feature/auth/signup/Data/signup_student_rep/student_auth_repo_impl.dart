import 'package:dartz/dartz.dart';
import 'package:school/Feature/auth/signup/Data/signup_student_rep/student_auth_repository.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

class StudentAuthRepoImpl implements StudentAuthRepository {
  @override
  Future<Either<Failure,void>>registerStudent({
    required String name,
    required String fatherName,
    required String motherName,
    required String email,
    required String configePsassword,
    required String birhthDate,
    required String department,
    required String grade,
    required String phone,
    required String password,
  })  async {
    try{

    await Future.delayed(const Duration(seconds: 2));
    print("successful enter information student:$name");
      return right(null);
    }on ServerException catch(e){
       return left(serverFailure(errorMessage: e.modelErrors.errorMessage));
    
  }catch(e){
 return left(serverFailure(errorMessage: "errorMessage: ${e.toString()}"));
  }}
}
