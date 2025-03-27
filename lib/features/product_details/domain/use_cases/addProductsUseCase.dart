import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../repositories/product_repo.dart';
@injectable
class AddProductsUseCase {
  ProductDetailsRepo repository;
  AddProductsUseCase(this.repository);
  Future<Either<RouteFailures, AddToCartModel>> call(String prodId) =>
      repository.addToCart(prodId);
}