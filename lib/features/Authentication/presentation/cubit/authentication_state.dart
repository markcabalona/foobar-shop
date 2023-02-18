// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final User? user;
  final String? errorMessage;
  final String? loadingMessage;
  final AuthStatus authStatus;
  const AuthenticationState({
    this.user,
    this.errorMessage,
    this.loadingMessage,
    this.authStatus = AuthStatus.unauthenticated,
  });

  @override
  List<Object> get props => [
        if (user != null) user!,
        if (errorMessage != null) errorMessage!,
        if (loadingMessage != null) loadingMessage!,
        authStatus,
      ];

  AuthenticationState copyWith({
    User? user,
    String? errorMessage,
    String? loadingMessage,
    AuthStatus? authStatus,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
      errorMessage: errorMessage,
      loadingMessage: loadingMessage,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
