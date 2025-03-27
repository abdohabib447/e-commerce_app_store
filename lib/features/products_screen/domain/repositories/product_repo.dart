import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';

import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';

abstract class ProductRepo{
 Future<Either<RouteFailures,ProductsModel>> getProduct(String catId);

}