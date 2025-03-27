import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';

abstract class CategoryRepo{
 Future<Either<RouteFailures,CategoryModel>> getSubCategories(String catId);

}