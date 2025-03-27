import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failuers.dart';
import '../../data/models/category_model.dart';
import '../repository/category_repo.dart';

@injectable
class GetCategoryUseCase {
  CategoryRepository repository;

  GetCategoryUseCase(this.repository);

  Future<Either<RouteFailures, CategoryModel>> call() =>
      repository.getCategory();
}