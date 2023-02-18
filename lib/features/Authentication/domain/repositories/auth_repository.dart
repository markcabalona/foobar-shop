import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, User>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  });
}
