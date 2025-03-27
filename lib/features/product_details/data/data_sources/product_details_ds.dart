

import '../models/add_to_cart_model.dart';

abstract class ProductDetailsDs {
  Future <AddToCartModel> addToCart(String prodId);
}