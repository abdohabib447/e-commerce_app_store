import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../../../../auth/data/models/user_model.dart';
abstract class ProfileRepo{
  Future<Either<RouteFailures,UserModel>>  profileTab(ProfileModel profileModel);

}