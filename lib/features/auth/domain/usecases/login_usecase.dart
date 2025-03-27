import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/auth/domain/repository/repository/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;
  LoginUseCase(this.repo);
  Future<Either<RouteFailures,bool>> call(String email, String password) =>
      repo.sighIn(email, password);
}
