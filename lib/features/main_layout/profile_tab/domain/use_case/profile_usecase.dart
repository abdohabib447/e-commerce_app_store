import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../../../../auth/data/models/user_model.dart';
import '../repository/profile_repo.dart';
@injectable
class ProfileUseCase {
  ProfileRepo repo;
  ProfileUseCase(this.repo);
  Future<Either<RouteFailures,UserModel>> call(ProfileModel profileModel) =>
      repo.profileTab(profileModel);
}
