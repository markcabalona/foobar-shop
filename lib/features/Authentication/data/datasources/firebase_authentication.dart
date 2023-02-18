import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/features/Authentication/data/datasources/remote_datasource.dart';

class FirebaseAuthentication implements RemoteDataSource {
  @override
  Future<User> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
