import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';

import '../../data/models/add_to_cart_model.dart';


abstract class ProductDetailsRepo{
 Future<Either<RouteFailures,AddToCartModel>> addToCart(String prodId);

}