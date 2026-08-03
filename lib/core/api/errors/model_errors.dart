


import 'package:school/core/api/endpoint.dart';

class ModelErrors {
 String errorMessage;
 int status;
 ModelErrors({required this.errorMessage,required this.status});
 factory ModelErrors.fromJson(Map<String,dynamic>jsonData){
  return ModelErrors(
    errorMessage: jsonData[ApiKey.errormessage],
     status: jsonData[ApiKey.status]);
 }
 
 
}