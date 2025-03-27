import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/core/exceptions/failuers.dart';

import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/category_repo.dart';
import '../data_sources/category_ds.dart';
@Injectable(as: CategoryRepo)
class CategoryRepoImp implements CategoryRepo{
  CategoryDs categoryDs;
  CategoryRepoImp(this.categoryDs);
  @override
  Future<Either<RouteFailures, CategoryModel>> getSubCategories(String catId) async{
try{

  var data =await categoryDs.getSubCategories( catId);
  return right(data);
}
    catch(e){
  return left(RouteRemoteFailures(e.toString()));
    }
  }

}