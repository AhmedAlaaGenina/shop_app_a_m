part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class LoginChangeVisibilityState extends LoginState {}

class RegisterLoadingState extends LoginState {}

class RegisterSuccessState extends LoginState {
  final LoginModel register;
  RegisterSuccessState(this.register);
}

class RegisterErrorState extends LoginState {
  final String error;

  RegisterErrorState(this.error);
}
