import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';

import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../repositories/cart_repo.dart';

@injectable
class CartUseCase {
  CartRepo repository;

  CartUseCase(this.repository);

  Future<Either<RouteFailures, CartModel>> call() =>
      repository.getCardItems();
}