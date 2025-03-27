import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../../data/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<RouteFailures, CategoryModel>> getCategory();
}