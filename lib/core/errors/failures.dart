// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  final String message;
  const Failure({
    required this.message,
  });
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
  });
}
