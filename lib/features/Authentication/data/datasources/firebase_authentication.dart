import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/core/errors/exceptions.dart';
import 'package:foobar_shop/core/mixins/firebase_handler_mixin.dart';
import 'package:foobar_shop/features/Authentication/data/datasources/remote_datasource.dart';

class FirebaseAuthentication
    with FirestoreHandlerMixin
    implements RemoteDataSource {
  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final userCreds = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCreds.user!;
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return firestoreHandler(
      request: () async {
        try {
          final userCreds =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          await firestore.collection('users').add({
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'date_created': DateTime.now().millisecondsSinceEpoch,
          });

          return userCreds.user!;
        } on FirebaseAuthException catch (e) {
          throw AuthException(message: e.message);
        }
      },
      onFailure: (error) {
        throw AuthException(message: error.message);
      },
    );
  }
}
