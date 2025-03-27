part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email;
  String password;
  LoginEvent(this.email,this.password);
}

class SignUpEvent extends AuthEvent {
  SignupEntity signupEntity;
  SignUpEvent (this.signupEntity);
}

class ForgetEvent extends AuthEvent {}

class ShowPassword extends AuthEvent {}
