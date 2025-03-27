import 'package:ecommerce_app/features/main_layout/profile_tab/data/data_source/profile_ds.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../di.dart';
import '../../../../auth/data/models/user_model.dart';
@Injectable(as: ProfileDs)
class ProfileDsImp implements ProfileDs{
  ApiManager apiManager;
  ProfileDsImp(this.apiManager);
  @override
  Future<UserModel>  profileData(ProfileModel profileModel) async {
    var response = await getIt<ApiManager>()
        .getData(endPoint: EndPoints.users,
    param: profileModel.toJson());

    UserModel userModel =UserModel.fromJson(response.data);
    return userModel ;
  }

}