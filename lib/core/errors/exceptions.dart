// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomException implements Exception {
  final String? message;
  const CustomException({
    this.message,
  });
}

class AuthException extends CustomException {
  const AuthException({super.message});
}

class ProductException extends CustomException {
  const ProductException({super.message});
}
