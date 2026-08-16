abstract class Failure {
  String errorMessage;

  Failure({required this.errorMessage});
}

class serverFailure extends Failure {
  serverFailure({required super.errorMessage});
}
