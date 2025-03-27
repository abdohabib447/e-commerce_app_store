
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/failuers.dart';
import '../../../data/models/user_model.dart';
import '../../entity/signUp_entity.dart';

abstract class AuthRepo{

  Future<Either<RouteFailures,bool>>   sighIn(String email, String password);
  Future<Either<RouteFailures,UserModel>>  signUp(SignupEntity signupEntity);
}