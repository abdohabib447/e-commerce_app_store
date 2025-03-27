import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';

import '../../data/models/cart_model.dart';


abstract class CartRepo{
 Future<Either<RouteFailures,CartModel>> getCardItems( );

}