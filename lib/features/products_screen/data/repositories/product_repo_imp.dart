import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/core/exceptions/failuers.dart';

import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/product_repo.dart';
import '../data_sources/product_ds.dart';

@Injectable(as: ProductRepo)
class ProductRepoImp implements ProductRepo{
  ProductDs productDs;
  ProductRepoImp(this.productDs);
  @override
  Future<Either<RouteFailures, ProductsModel>> getProduct(String catId) async{
try{

  var data =await productDs.getProducts( catId);
  return right(data);
}
    catch(e){
  return left(RouteRemoteFailures(e.toString()));
    }
  }

}