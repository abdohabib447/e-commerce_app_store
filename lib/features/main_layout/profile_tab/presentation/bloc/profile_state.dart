part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    @Default(RequestState.init)  RequestState profileState,
    UserModel? userModel ,
  }) = _Initial;
}