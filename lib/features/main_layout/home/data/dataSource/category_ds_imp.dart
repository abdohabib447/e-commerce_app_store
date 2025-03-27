import 'package:ecommerce_app/di.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../models/category_model.dart';
import 'category_ds.dart';

@Injectable(as: CategoryDS)
class CategoryDSImpl implements CategoryDS {

  @override
  Future<CategoryModel> getCategories() async {
    try {
      var response = await getIt<ApiManager>().getData(endPoint: EndPoints.category);
print(response);
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel;
    } catch (e) {
      throw RouteRemoteException(e.toString());
    }
  }
}