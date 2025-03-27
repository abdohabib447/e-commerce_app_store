import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signUp_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repository/repository/auth_repo.dart';

import '../../../../core/exceptions/failuers.dart';
import '../models/user_model.dart';

class AuthRepoImp implements AuthRepo {
  AuthRemoteDs authRemoteDs;
  AuthRepoImp(this.authRemoteDs);
  @override
  Future<Either<RouteFailures, bool>> sighIn(
      String email, String password) async {
    try {
      bool loggedIn = await authRemoteDs.sighIn(email, password);
      if (!loggedIn) {
        return Left(
            RouteInvalidCredtionalFailures("invalid userName our password "));
      }
      return Right(loggedIn);
    } catch (e) {
      return Left(RouteRemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, UserModel>> signUp(
      SignupEntity signupEntity) async {
    try {
      var userModel = await authRemoteDs.signUp(signupEntity);
      print(userModel);
      return Right(userModel);
    } catch (e) {
      return Left(RouteRemoteFailures(e.toString()));
    }
  }
}
