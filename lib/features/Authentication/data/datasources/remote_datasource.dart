import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<User> login({required String email, required String password});
  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
