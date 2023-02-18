import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_inputs_cubit_state.dart';

class AuthInputsCubit extends Cubit<AuthInputsState> {
  AuthInputsCubit()
      : super(const AuthInputsState(
          loginInputs: LoginInputs(),
          registrationInputs: RegistrationInputs(),
        ));

  void resetInputs() {
    emit(const AuthInputsState(
      loginInputs: LoginInputs(),
      registrationInputs: RegistrationInputs(),
    ));
  }

  void updateLoginInputs({
    String? email,
    String? password,
  }) {
    emit(state.copyWith(
      loginInputs: state.loginInputs.copyWith(
        email: email,
        password: password,
      ),
    ));
  }

  void updateRegistrationInputs({
    String? email,
    String? password,
    String? passwordConfirmation,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    emit(state.copyWith(
      registrationInputs: state.registrationInputs.copyWith(
        firstName: firstName,
        lastName: lastName,
        passwordConfirmation: passwordConfirmation,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      ),
    ));
  }
}
