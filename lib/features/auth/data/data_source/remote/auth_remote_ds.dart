import '../../../domain/entity/signUp_entity.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDs {

Future<bool>  sighIn(String email, String password);
Future<UserModel>  signUp(SignupEntity signupEntity);
}