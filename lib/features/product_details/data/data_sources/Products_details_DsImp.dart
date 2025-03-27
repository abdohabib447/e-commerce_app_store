import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/cache/shared_pref.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../models/add_to_cart_model.dart';
import 'product_details_ds.dart';

@Injectable(as: ProductDetailsDs)
class ProductsDetailsDsImp implements ProductDetailsDs {
  @override
  Future<AddToCartModel> addToCart(String prodId) async {
    var response = await getIt<ApiManager>()
        .postData(endPoint: EndPoints.cart, body: {'productId':prodId},
      headers: {'token':CacheHelper.getData<String>('token'),}
);

    AddToCartModel addToCartModel =AddToCartModel.fromJson(response.data);
    return addToCartModel ;
  }
}
