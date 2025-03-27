

import '../models/cart_model.dart';

abstract class CartDs {
  Future <CartModel> getCardItems();
}