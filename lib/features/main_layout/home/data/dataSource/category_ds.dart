

import '../models/category_model.dart';

abstract class CategoryDS{

  Future<CategoryModel> getCategories();
}