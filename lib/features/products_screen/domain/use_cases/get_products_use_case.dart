import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failuers.dart';
@injectable
class GetProductsUseCase {
  ProductRepo repository;

  GetProductsUseCase(this.repository);

  Future<Either<RouteFailures, ProductsModel>> call(String catId) =>
      repository.getProduct(catId);
}