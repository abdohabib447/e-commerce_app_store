import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/failuers.dart';
import '../../../home/data/models/category_model.dart';
@injectable
class GetSubCategoryUseCase {
  CategoryRepo repository;

  GetSubCategoryUseCase(this.repository);

  Future<Either<RouteFailures, CategoryModel>> call(String catId) =>
      repository.getSubCategories(catId);
}