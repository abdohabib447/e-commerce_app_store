import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import 'product_ds.dart';

@Injectable(as: ProductDs)
class ProductsDsImp implements ProductDs {
  @override
  Future<ProductsModel> getProducts(String catId) async {
    var response = await getIt<ApiManager>()
        .getData(endPoint: EndPoints.product,param:
{    'category[in]':catId});

    ProductsModel productsModel =ProductsModel.fromJson(response.data);
    return productsModel ;
  }
}
