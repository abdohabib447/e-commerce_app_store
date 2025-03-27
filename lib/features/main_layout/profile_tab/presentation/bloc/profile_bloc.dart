import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/enums.dart';
import '../../domain/use_case/profile_usecase.dart';
part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';
@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileUseCase profileUseCase;
  ProfileBloc(this.profileUseCase) : super(const ProfileState.initial()) {
    on<UpdateProfile>((event, emit) async{
      emit(state.copyWith(profileState: RequestState.loading));
      var result = await profileUseCase(event.profileModel);
      result.fold((l) {
        emit(state.copyWith(profileState:RequestState.error));
      }, (r) {
        emit(state.copyWith(profileState:RequestState.success));
      },);
    });
  }
}
