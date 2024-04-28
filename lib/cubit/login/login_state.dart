import 'package:app_test/models/login_model.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final dynamic error;

  LoginErrorState(this.error);
}
