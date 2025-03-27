

import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';

import '../../../../auth/data/models/user_model.dart';

abstract class ProfileDs {
  Future<UserModel>  profileData(ProfileModel profileModel);
}