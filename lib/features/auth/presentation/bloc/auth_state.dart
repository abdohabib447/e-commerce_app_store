part of 'auth_bloc.dart';

class AuthLoginState {
  RequestState? requestState;
  bool? LoggedIn;
  String? errorMessage;

  AuthLoginState({this.requestState, this.errorMessage, this.LoggedIn});


  AuthLoginState copyWith({ RequestState? requestState,  String? errorMessage,  bool? LoggedIn}) {
return AuthLoginState(
  errorMessage: errorMessage?? this.errorMessage ,
  LoggedIn: LoggedIn?? this.LoggedIn,
  requestState: requestState?? this.requestState
);

  }
}

class AuthLoginInit extends AuthLoginState{
  AuthLoginInit():super(requestState: RequestState.init,LoggedIn:false ,errorMessage: "");
}


