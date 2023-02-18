// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/core/errors/failures.dart';
import 'package:foobar_shop/core/mixins/repository_handler_mixins.dart';
import 'package:foobar_shop/features/Authentication/data/datasources/remote_datasource.dart';
import 'package:foobar_shop/features/Authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl with RepositoryHandlerMixin implements AuthRepository {
  final RemoteDataSource datasource;
  AuthRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<AuthFailure, User>> login({
    required String email,
    required String password,
  }) {
    return this(
      request: () {
        return datasource.login(email: email, password: password);
      },
      onFailure: (message) {
        return AuthFailure(message: message ?? 'Something went wrong...');
      },
    );
  }

  @override
  Future<Either<AuthFailure, User>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return this(
      request: () {
        return datasource.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );
      },
      onFailure: (message) {
        return AuthFailure(message: message ?? 'Something went wrong...');
      },
    );
  }
}
