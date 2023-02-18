// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final User? user;
  final String? errorMessage;
  final AuthStatus authStatus;
  const AuthenticationState({
    this.user,
    this.errorMessage,
    this.authStatus = AuthStatus.unauthenticated,
  });

  @override
  List<Object> get props => [
        if (user != null) user!,
        if (errorMessage != null) errorMessage!,
        authStatus,
      ];

  AuthenticationState copyWith({
    User? user,
    String? errorMessage,
    AuthStatus? authStatus,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
