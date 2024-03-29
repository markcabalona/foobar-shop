import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/core/enums/state_status.dart';
import 'package:foobar_shop/features/Authentication/data/datasources/firebase_authentication.dart';
import 'package:foobar_shop/features/Authentication/data/repositories/auth_repository_impl.dart';
import 'package:foobar_shop/features/Authentication/domain/repositories/auth_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late final AuthRepository _repository;
  AuthenticationCubit() : super(const AuthenticationState()) {
    _repository = AuthRepositoryImpl(
      datasource: FirebaseAuthentication(),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(
      authStatus: AuthStatus.authenticating,
      loadingMessage: 'Logging In. Please wait',
    ));
    final result = await _repository.login(email: email, password: password);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.unauthenticated,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: user,
          ),
        );
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(state.copyWith(
      authStatus: AuthStatus.authenticating,
      loadingMessage: 'Creating your account',
    ));
    final result = await _repository.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            authStatus: AuthStatus.unauthenticated,
          ),
        );
      },
      (user) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: user,
          ),
        );
      },
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    emit(const AuthenticationState());
  }
}
