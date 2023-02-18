// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_inputs_cubit_cubit.dart';

abstract class AuthInputs extends Equatable {
  final String? email;
  final String? password;
  const AuthInputs({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        if (email != null) email!,
        if (password != null) password!,
      ];
}

class LoginInputs extends AuthInputs {
  const LoginInputs({
    super.email,
    super.password,
  });

  LoginInputs copyWith({
    String? email,
    String? password,
  }) {
    return LoginInputs(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class RegistrationInputs extends AuthInputs {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? passwordConfirmation;
  const RegistrationInputs({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    super.email,
    super.password,
    this.passwordConfirmation,
  });

  @override
  List<Object?> get props => super.props
    ..addAll([
      if (firstName != null) firstName!,
      if (lastName != null) lastName!,
      if (phoneNumber != null) phoneNumber!,
      if (passwordConfirmation != null) passwordConfirmation!,
    ]);

  RegistrationInputs copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? passwordConfirmation,
    String? email,
    String? password,
  }) {
    return RegistrationInputs(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class AuthInputsState extends Equatable {
  final LoginInputs loginInputs;
  final RegistrationInputs registrationInputs;
  const AuthInputsState({
    required this.loginInputs,
    required this.registrationInputs,
  });

  @override
  List<Object> get props => [
        loginInputs,
        registrationInputs,
      ];

  AuthInputsState copyWith({
    LoginInputs? loginInputs,
    RegistrationInputs? registrationInputs,
  }) {
    return AuthInputsState(
      loginInputs: loginInputs ?? this.loginInputs,
      registrationInputs: registrationInputs ?? this.registrationInputs,
    );
  }
}
