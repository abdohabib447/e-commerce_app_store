
import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';

abstract class ProductDs {
  Future <ProductsModel> getProducts(String catId);
}