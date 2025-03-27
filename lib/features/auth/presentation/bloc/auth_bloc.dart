import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signUp_entity.dart';
import 'package:meta/meta.dart';
import '../../../../core/exceptions/failuers.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthLoginState> {
  LoginUseCase loginUseCase;
  SignUpUseCase signUpUseCase;
  AuthBloc(this.loginUseCase, this.signUpUseCase) : super(AuthLoginInit()) {
    on<AuthEvent>((event, emit) {});

    on<LoginEvent>((event, emit) async {

      state.copyWith(requestState: RequestState.loading);

      var data = await loginUseCase.call(event.email, event.password);
      data.fold(
        (l) {
          emit(state.copyWith(
              LoggedIn: false,
              errorMessage: l.message,
              requestState: RequestState.error));
        },
        (r) {

          emit.call(AuthLoginState());
          emit(state.copyWith(LoggedIn: r, requestState: RequestState.success));
        },
      );
    });

    on<SignUpEvent>(
      (event, emit) async {
        var data = await signUpUseCase.call(event.signupEntity);
        data.fold(
          (l) {
            emit(state.copyWith(requestState: RequestState.error));
          },
          (r) {
            emit(state.copyWith(requestState: RequestState.success));
          },
        );
      },
    );
  }
}
