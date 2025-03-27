import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/auth/domain/repository/repository/auth_repo.dart';

import '../../data/models/user_model.dart';
import '../entity/signUp_entity.dart';

class SignUpUseCase {
  AuthRepo repo;
  SignUpUseCase(this.repo);
  Future<Either<RouteFailures,UserModel>> call( SignupEntity signupEntity) =>
      repo.signUp(signupEntity);
}
