import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/status_code.dart';
import 'package:ecommerce_app/core/cache/shared_pref.dart';
import 'package:ecommerce_app/core/exceptions/exceptions.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signUp_entity.dart';
import '../../models/user_model.dart';

class AuthRemoteDsImp implements AuthRemoteDs {
  ApiManager apiManager;
  AuthRemoteDsImp(this.apiManager);
  @override
  Future<bool> sighIn(String email, String password) async {
    try {
      final response = await apiManager.postData(
          endPoint: EndPoints.signIn,
          body: {"email": email, "password": password});

      if (response.statusCode == StatusCode.success) {
        print(response.data['token']);
        await CacheHelper.setData<String>("token", response.data['token']);
        return true;
      }
      return false;
    } catch (e) {
      throw RouteRemoteException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(SignupEntity signupEntity) async {
    try {
      var response = await apiManager.postData(
          endPoint: EndPoints.signUp, body: signupEntity.toJson());
      print("response data ============== ${response.data}");
      print(response.statusCode);
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      print("exception");
      throw RouteRemoteException(e.toString());
    }
  }
}
