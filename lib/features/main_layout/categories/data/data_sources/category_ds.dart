import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';

abstract class CategoryDs {
  Future <CategoryModel> getSubCategories(String catId);
}