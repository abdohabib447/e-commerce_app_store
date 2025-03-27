import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/cache/shared_pref.dart';
import 'package:injectable/injectable.dart';
import '../../../../../di.dart';
import '../models/cart_model.dart';
import 'cart_ds.dart';

@Injectable(as: CartDs)
class cartsDsImpl implements CartDs {
  @override
  Future<CartModel> getCardItems() async {
    var response =
    await getIt<ApiManager>()
        .getData(endPoint: EndPoints.cart,
      headers: {'token':CacheHelper.getData<String>('token')}
);

print(response.requestOptions);
print(response.statusMessage);
print(response.statusCode);
    CartModel cartModel =CartModel.fromJson(response.data);
    return cartModel ;
  }
}
