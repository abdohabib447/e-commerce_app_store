import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import 'category_ds.dart';

@Injectable(as: CategoryDs)
class CategoryDsImp implements CategoryDs {
  @override
  Future<CategoryModel> getSubCategories(String catId) async {
    var response = await getIt<ApiManager>()
        .getData(endPoint: "${EndPoints.category}/$catId/subcategories");

    CategoryModel subCategoryModel =CategoryModel.fromJson(response.data);
    return subCategoryModel ;
  }
}
